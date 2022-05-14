set -g window-status-current-style fg=colour234,bg=colour242,bold
setw -g window-status-format "#[fg=colour153,bg=colour238]  #I #W  "
setw -g window-status-current-format "#[fg=colour238,bg=colour81,nobold,nounderscore,noitalics]#[fg=colour235,bg=colour81] #I #W #[fg=colour81,bg=colour238,nobold,nounderscore,noitalics]"
set -g status-left ""
set -g status-right "#[bg=colour238,fg=colour25]#[fg=colour0,bg=colour25]  #(whoami)@#h #[bg=colour25,fg=colour238]"
set -g status-style fg=colour246,bg=colour238

if-shell '[ -f $HOME/scripts/todo.sh ]' \
    'set -g status-right "#[fg=colour81,bg=colour238]#[fg=colour235,bg=colour81]  #($HOME/scripts/todo.sh) #[fg=colour153,bg=colour81]#[fg=colour235,bg=colour153]  #($HOME/scripts/todo.sh -f) #[fg=colour81,bg=colour153]#[fg=colour235,bg=colour81]  #(whoami)@#h "'

