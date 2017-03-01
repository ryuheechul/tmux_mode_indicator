#!/usr/bin/env bash

# CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# tmux bind-key T run-shell "$CURRENT_DIR/scripts/tmux_list_plugins.sh"

prefix_pressed_text="PREFIX PRESSED"
insert_mode_text="INSERT"
copy_mode_text="COPY"
normal_mode_text="NORMAL"
separator="✤"

prefix_mode_fg="colour226"
normal_mode_fg="colour16"
copy_mode_fg="colour82"
bg="colour33"


main() {
        prefix_indicator="#[bg=${bg}]#{?client_prefix,#[fg=${prefix_mode_fg}]${prefix_pressed_text},#[fg=${normal_mode_fg}]${normal_mode_text}}"
        normal_or_copy_indicator="#[bg=${bg}]#{?pane_in_mode,#[fg=${copy_mode_fg}]${copy_mode_text},#[fg=${normal_mode_fg}]${insert_mode_text}}";
        echo -n "#[fg=${bg}]"
        echo -n "#[bg=${bg}] "
        echo -n $prefix_indicator "#[fg=${normal_mode_fg}]${separator}" $normal_or_copy_indicator
        echo "#[bg=${bg}] "
        return 0
}

main
