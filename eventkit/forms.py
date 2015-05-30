"""
Forms for ``eventkit`` app.
"""

import json

from django import forms
from django.contrib.admin.widgets import AdminTextareaWidget
from django.template import Context, loader

from eventkit import models


# WIDGETS #####################################################################


class RecurrenceRuleWidget(forms.MultiWidget):
    """
    A ``MultiWidget`` subclass that uses a ``Select`` widget for selection of
    preset recurrence rules and an ``AdminTextareaWidget`` for custom
    recurrence rules.
    """

    class Media:
        css = {
            'all': ('eventkit/css/recurrence_rule_widget.css', ),
        }

    def __init__(self, *args, **kwargs):
        """
        Set the default widgets and queryset.
        """
        widgets = kwargs.pop('widgets', (
            forms.Select,
            AdminTextareaWidget,
        ))
        super(RecurrenceRuleWidget, self).__init__(
            widgets=widgets, *args, **kwargs)
        self.queryset = models.RecurrenceRule.objects.all()

    def _get_choices(self):
        """
        Return choices from the ``Select`` widget.
        """
        return self.widgets[0].choices

    def _set_choices(self, value):
        """
        Set choices on the ``Select`` widget.
        """
        self.widgets[0].choices = list(value)

    choices = property(_get_choices, _set_choices)

    def decompress(self, value):
        """
        Return the primary key value for the ``Select`` widget if the given
        recurrence rule exists in the queryset.
        """
        if value:
            try:
                pk = self.queryset.get(recurrence_rule=value)
            except self.queryset.model.DoesNotExist:
                pk = None
            return [pk, value]
        return [None, None]

    def format_output(self, rendered_widgets):
        """
        Render the ``eventkit/recurrence_rule_widget/format_output.html``
        template with the following context:

            select
                A choice field for preset recurrence rules.
            textarea
                A text field for custom recurrence rules.

        The default template positions the select widget above the textarea.
        """
        template = loader.get_template(
            'eventkit/recurrence_rule_widget/format_output.html')
        select, textarea = rendered_widgets
        context = Context({
            'select': select,
            'textarea': textarea,
        })
        return template.render(context)

    def render(self, name, value, attrs=None):
        """
        Render the ``eventkit/recurrence_rule_widget/render.html`` template
        with the following context:

            rendered_widgets
                The rendered widgets.
            id
                The ``id`` attribute from the ``attrs`` keyword argument.
            recurrence_rules
                A JSON object mapping recurrence rules to their primary keys.

        The default template adds JavaScript event handlers that update the
        ``Textarea`` and ``Select`` widgets when they are updated.
        """
        rendered_widgets = super(RecurrenceRuleWidget, self).render(
            name, value, attrs)
        template = loader.get_template(
            'eventkit/recurrence_rule_widget/render.html')
        recurrence_rules = json.dumps(dict(
            self.queryset.values_list('pk', 'recurrence_rule')))
        context = Context({
            'rendered_widgets': rendered_widgets,
            'id': attrs['id'],
            'recurrence_rules': recurrence_rules,
        })
        return template.render(context)


# FIELDS ######################################################################


class RecurrenceRuleField(forms.MultiValueField):
    """
    A ``MultiValueField`` subclass that uses a ``ModelChoiceField`` for
    selection of preset recurrence rules and a ``CharField`` for custom
    recurrence rules.
    """
    widget = RecurrenceRuleWidget

    def __init__(self, *args, **kwargs):
        """
        Set the default fields and queryset.
        """
        queryset = kwargs.pop('queryset', models.RecurrenceRule.objects.all())
        max_length = kwargs.pop('max_length')
        fields = (
            forms.ModelChoiceField(queryset=queryset, required=False),
            forms.CharField(max_length=max_length),
        )
        kwargs.setdefault('fields', fields)
        kwargs.setdefault('require_all_fields', False)
        super(RecurrenceRuleField, self).__init__(*args, **kwargs)
        self.queryset = queryset

    def compress(self, values):
        """
        Always return the value from the ``CharField``. Even when a preset is
        selected, the recurrence rule is always defined in the ``CharField``.
        """
        return values[1] or None

    def _get_queryset(self):
        """
        Return the queryset from the ``ModelChoiceField``.
        """
        return self.fields[0].queryset

    def _set_queryset(self, queryset):
        """
        Set the queryset on the ``ModelChoiceField`` and choices on the widget.
        """
        self.fields[0].queryset = self.widget.queryset = queryset
        self.widget.choices = self.fields[0].choices

    queryset = property(_get_queryset, _set_queryset)
