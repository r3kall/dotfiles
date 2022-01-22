""" widgets.py """

from libqtile import widget

from settings.theme import colors


def base(fg="color07", bg="color00"):
    return {"foreground": colors[fg], "background": colors[bg]}

def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)

def workspaces():
    return [
        separator(),
        widget.GroupBox(
            **base(),
            # font="UbuntuMono Nerd Font",
            # fontsize=24,
            margin_y=3,
            margin_x=0,
            padding_y=6,
            padding_x=5,
            borderwidth=0,
            active=colors["color07"],
            inactive=colors["color03"],
            highlight_method="block",
            this_current_screen_border=colors["color0B"],
            other_current_screen_border=colors["color0B"],
            rounded=False,
            disable_drag=True,
        ),
        separator(),
        widget.WindowName(**base(), padding=5),
        separator(),
    ]

widgets = [
    *workspaces(),
    separator(),
    widget.CurrentLayoutIcon(**base(), scale=0.65),
    widget.CurrentLayout(**base(), padding=5),
    separator(),
    widget.Clock(**base(), format="%d/%m/%Y - %H:%M", padding=5),
    separator(),
    widget.Systray(background=colors["color00"], padding=5),
    separator(),
]

widget_defaults = {
    "font": "UbuntuMono Nerd Font",
    "fontsize": 18,
    "padding": 0,
}

extension_defaults = widget_defaults.copy()
