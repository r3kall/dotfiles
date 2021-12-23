""" groups.py """

from libqtile.config import Group
from libqtile.dgroups import simple_key_binder

groups = [Group("DESK", layout="max"),
          Group("WEB",  layout="monadtall"),
          Group("SYS1", layout="monadtall"),
          Group("SYS2", layout="monadtall"),
          Group("DOC",  layout="monadtall"),
          Group("VIRT", layout="monadtall"),
          Group("MUS",  layout="monadtall"),
          Group("VID",  layout="max"),
          Group("GFX",  layout="floating")]

# Allow MODKEY + [0-9] to bind to groups
# MOD + [0-9]: switch to group[index]
# MOD + Shift + [0-9]: send active window to group[index]
dgroups_key_binder = simple_key_binder("mod4")

