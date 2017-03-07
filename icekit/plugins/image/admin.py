from django.contrib import admin
from django.conf import settings
from django.template import Context
from django.template import Template
from django.utils.safestring import mark_safe

from icekit.utils.admin.mixins import ThumbnailAdminMixin

from . import models

try:
    ADMIN_THUMB_ALIAS = settings.THUMBNAIL_ALIASES['']['admin']
except (AttributeError, KeyError):
    ADMIN_THUMB_ALIAS = {'size': (150, 150)}

class ImageAdmin(ThumbnailAdminMixin, admin.ModelAdmin):
    list_display = ['thumbnail', 'title', 'alt_text', 'is_ok_for_web', 'date_created', 'date_modified']
    list_display_links = ['alt_text', 'title', 'thumbnail']
    date_hierarchy = 'date_modified'
    filter_horizontal = ['categories', ]
    list_filter = ['categories',]
    search_fields = [
        'title',
        'alt_text',
        'caption',
        'image',
        'credit',
        'license',
        'source',
        'notes',
    ]

    fieldsets = (
        (None, {
            'fields': (
                'image_tag',
                'image',
                'title',
                'alt_text',
                'caption',
                ('dimensions', 'file_size'),
            )
        }),
        ('Organization', {
            'fields': ('categories', ('date_created', 'date_modified',) ),
        }),
        ('Usage', {
            'fields': (
                ('is_ok_for_web', 'maximum_dimension'),
                'credit',
                'license',
                'source',
                'notes',
            ),
        }),
    )

    readonly_fields = ('image_tag', 'file_size', 'dimensions', 'date_created', 'date_modified')

    change_form_template = 'image/admin/change_form.html'

    # ThumbnailAdminMixin attributes
    thumbnail_field = 'image'
    thumbnail_options = ADMIN_THUMB_ALIAS

    def image_tag(self, obj):
        t = Template("""{% load thumbnail %}<img src="{% thumbnail obj.image 500x500 %}">
        """)
        return mark_safe(t.render(Context({'obj': obj})))

    image_tag.short_description = 'Image'


admin.site.register(models.Image, ImageAdmin)
