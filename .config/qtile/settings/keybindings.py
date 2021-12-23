""" keybindings.py """
from libqtile import layout
from libqtile.config import Key, Drag, Click
from libqtile.utils import guess_terminal
from libqtile.lazy import lazy

mod   = "mod4"
alt   = "mod1"
altgr = "mod5"
shift = "shift"
ctrl  = "control"

terminal = guess_terminal()

keys = [
    #### WINDOW CONTROL ####
    # Switch between windows
    Key([mod], "j", lazy.layout.down(),     desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(),       desc="Move focus up"),
    
    # MonadTall
    Key([mod], "h", 
        lazy.layout.shrink(),
        lazy.layout.decrease_nmaster(),
        desc="Shrink window (MonadTall), decrease number in master pane."),

    Key([mod], "l",
        lazy.layout.grow(),
        lazy.layout.increase_nmaster(),
        desc="Expand window (MonadTall), increase number in master pane."),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, shift], "j", 
        lazy.layout.shuffle_down(), 
        lazy.layout.section_down(),  
        desc="Move windows down in the current stack"),

    Key([mod, shift], "k", 
        lazy.layout.shuffle_up(),
        lazy.layout.section_up(),
        desc="Move windows up in the current stack"),
    
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    
    Key([mod], "m", lazy.layout.maximize(),  desc="Toggle window betwen min and max size."),
    
    # Floating Keys.
    Key([mod, shift], "f", lazy.window.toggle_floating(),   desc="Toggle floating."),
    
    Key([mod, shift], "g", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),
    
    #### STACK CONTROL ####
    Key([mod], "space", 
        lazy.layout.next(), 
        desc="Switch window focus to other pane of stack"),

    Key([mod, shift], "space",
        lazy.layout.toggle_split(), 
        desc="Toggle between split and unsplit sides of stack"),

    Key([mod, shift], "Tab", 
        lazy.layout.rotate(), 
        lazy.layout.flip(), 
        desc="Switch which side main pane occupies (MonadTall)"),

    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(),      desc="Toggle between layouts"),
    
    Key([mod], "w", lazy.window.kill(),        desc="Kill focused window"),

    Key([mod, ctrl], "r", lazy.restart(),      desc="Restart Qtile"),
    
    Key([mod, ctrl], "q", lazy.shutdown(),     desc="Shutdown Qtile"),
    
    Key([mod], "r", lazy.spawncmd(),           desc="Spawn a command using a prompt widget"),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

