# History
# http://zsh.sourceforge.net/Doc/Release/Options.html#History

HISTFILE="$ZDOTDIR/.zhistory"
HISTSIZE=4096
SAVEHIST=4096

setopt BANG_HIST               # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY        # Save each command's epoch timestamps and the duration in seconds.
setopt HIST_EXPIRE_DUPS_FIRST  # Expire duplicate entries first when trimming history.
setopt HIST_FIND_NO_DUPS       # Don't display a line previously found.
setopt HIST_IGNORE_DUPS        # Don't record an entry that is duplicate of the previous event.
setopt HIST_IGNORE_SPACE       # Don't record an entry starting with a space.
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks before recording an entry.
setopt HIST_FCNTL_LOCK         # Locking is done by means of the system’s fcntl call, when available. 
setopt APPEND_HISTORY          # Append to the history file when the shell exits.
setopt SHARE_HISTORY           # Share history between all sessions.
