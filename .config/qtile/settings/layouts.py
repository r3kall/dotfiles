""" layouts.py """

from libqtile import layout
from libqtile.config import Match

layout_conf = {
        "border_width": 2,
        "margin": 8,
        "border_focus": "e1acff",
        "border_normal": "1D2330"
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


