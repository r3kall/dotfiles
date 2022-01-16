""" widgets.py """

from libqtile import widget

from settings.theme import colors

def base(fg="text", bg="dark"):
    return {"foreground": colors[fg], "background": colors[bg]}

def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)

def workspaces():
    return [
        separator(),
        widget.GroupBox(
            **base(fg="light"),
            font="UbuntuMono Nerd Font",
            fontsize=18,
            margin_y=3,
            margin_x=0,
            padding_y=6,
            padding_x=5,
            borderwidth=0,
            active=colors["active"],
            inactive=colors["inactive"],
            highlight_method="block",
            this_current_screen_border=colors["focus"],
            other_current_screen_border=colors["dark"],
            rounded=False,
            disable_drag=True,
        ),
        separator(),
        widget.WindowName(**base(fg="focus"), fontsize=16, padding=5),
        separator(),
    ]

widgets = [
    *workspaces(),
    separator(),
    widget.CurrentLayoutIcon(**base(bg="color2"), scale=0.65),
    widget.CurrentLayout(**base(bg="color2"), padding=5),
    separator(),
    widget.Clock(**base(bg="color1"), format="%d/%m/%Y - %H:%M", padding=5),
    separator(),
    widget.Systray(background=colors["dark"], padding=5),
    separator(),
]

widget_defaults = {
    "font": "UbuntuMono Nerd Font",
    "fontsize": 14,
    "padding": 1,
}

extension_defaults = widget_defaults.copy()
