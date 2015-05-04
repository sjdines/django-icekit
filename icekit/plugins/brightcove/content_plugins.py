"""
Definition of the plugin.
"""
from django.utils.translation import ugettext_lazy as _
from fluent_contents.extensions import ContentPlugin, plugin_pool

from . import models


@plugin_pool.register
class ReusableImage(ContentPlugin):
    model = models.BrightcoveItem
    category = _('Media')
    render_template = 'icekit/plugins/brightcove/default.html'

    class FrontendMedia:
        js = (
            'http://admin.brightcove.com/js/BrightcoveExperiences.js',
        )
