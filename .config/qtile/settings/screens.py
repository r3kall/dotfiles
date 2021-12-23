""" screens.py """

from libqtile import bar
from libqtile.config import Screen

from settings.widgets import widgets

def status_bar(widget_list):
    return bar.Bar(widget_list, 24, opacity=0.92)

screens = [Screen(top=status_bar(widgets))]
