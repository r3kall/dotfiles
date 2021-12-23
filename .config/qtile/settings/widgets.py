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
            fontsize=18,
            active=colors["active"],
            inactive=colors["inactive"],
            rounded=False,
            disable_drag=True,
        ),
        separator(),
        widget.WindowName(**base(fg="focus"), fontsize=14, padding=5),
        separator(),
    ]

widgets = [
    *workspaces(),
    separator(),
    widget.CurrentLayoutIcon(**base(bg="color2"), scale=0.65),
    widget.CurrentLayout(**base(bg="color2"), padding=5),
    widget.Clock(**base(bg="color1"), format="%d/%m/%Y - %H:%M"),
    widget.Systray(background=colors["dark"], padding=5),
]

widget_defaults = {
    "font": "Hurmit Nerd Font Bold",
    "fontsize": 14,
    "padding": 1,
}

extension_defaults = widget_defaults.copy()
