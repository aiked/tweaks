
set-window-option -g xterm-keys on
unbind-key -n C-Left
unbind-key -n C-Right
bind h split-window -h
bind v split-window -v
unbind-key -n C-a
set -g prefix ^A
set -g prefix2 ^A
bind a send-prefix
