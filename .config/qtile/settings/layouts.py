""" layouts.py """

from libqtile import layout
from libqtile.config import Match
from settings.theme import colors

layout_conf = {
        "border_width": 1,
        "margin": 8,
        "border_focus": colors["active"][0],
        "border_normal": colors["inactive"][0]
    }

layouts = [
        layout.Max(),
        layout.MonadTall(**layout_conf),
        layout.Floating(**layout_conf)
    ]
        
# Run 'xprop' to see the wm class and name of an X client.
floating_layout = layout.Floating(float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),  # gitk
        Match(wm_class='makebranch'),  # gitk
        Match(wm_class='maketag'),  # gitk
        Match(wm_class='ssh-askpass'),  # ssh-askpass
        Match(title='branchdialog'),  # gitk
        Match(title='pinentry'),  # GPG key password entry
])


