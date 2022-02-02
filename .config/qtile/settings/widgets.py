""" widgets.py """

from libqtile import widget

from settings.theme import colors


def base(fg="base07", bg="base00"):
    return {"foreground": colors[fg], "background": colors[bg]}

def separator():
    return widget.Sep(**base(), linewidth=0)

def workspaces():
    return [
        separator(),
        widget.GroupBox(
            **base(),
            # font="UbuntuMono Nerd Font",
            # fontsize=24,
            # margin_y=3,
            # margin_x=0,
            # padding_y=6,
            # padding_x=5,
            borderwidth=0,
            active=colors["base07"],
            inactive=colors["base03"],
            highlight_method="text",
            this_current_screen_border=colors["base0E"],
            other_current_screen_border=colors["base0F"],
            rounded=False,
            disable_drag=True,
        ),
        separator(),
        widget.WindowName(**base()),
        separator(),
    ]

widgets = [
    *workspaces(),
    separator(),
    widget.CurrentLayoutIcon(**base(), scale=0.75),
    widget.CurrentLayout(**base()),
    separator(),
    widget.Clock(**base(), format="%d/%m/%Y - %H:%M"),
    separator(),
    widget.Systray(**base()),
    separator(),
]

widget_defaults = {
    "font": "UbuntuMono Nerd Font",
    "fontsize": 18,
    "padding": 5,
}

extension_defaults = widget_defaults.copy()
