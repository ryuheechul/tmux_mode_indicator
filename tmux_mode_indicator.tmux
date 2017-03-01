#!/usr/bin/env bash

# CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# tmux bind-key T run-shell "$CURRENT_DIR/scripts/tmux_list_plugins.sh"

get_tmux_option() {
  local option=$1
  local default_value=$2
  local option_value=$(tmux show-option -gqv "$option")
  if [ -z $option_value ]; then
    echo $default_value
  else
    echo $option_value
  fi
}

main() {
        # Text
        local default_copy_mode_text="COPY"
        local default_prefix_pressed_text="PREFIX PRESSED"
        local default_insert_mode_text="INSERT"
        local default_normal_mode_text="NORMAL"
        local default_separator="✤"
        # Colors
        local default_prefix_mode_fg="colour226"
        local default_normal_mode_fg="colour16"
        local default_copy_mode_fg="colour82"
        local default_bg="colour33"

        # Text
        readonly copy_mode_text="$(get_tmux_option "@copy_mode_text" $default_copy_mode_text)"
        readonly prefix_pressed_text="$(get_tmux_option "@prefix_pressed_text" $default_prefix_pressed_text)"
        readonly insert_mode_text="$(get_tmux_option "@insert_mode_text" $default_insert_mode_text)"
        readonly normal_mode_text="$(get_tmux_option "@normal_mode_text" $default_normal_mode_text)"
        readonly separator="$(get_tmux_option "@separator" $default_separator)"
        # Colors
        readonly prefix_mode_fg="$(get_tmux_option "@prefix_mode_fg" $default_prefix_mode_fg)"
        readonly normal_mode_fg="$(get_tmux_option "@normal_mode_fg" $default_normal_mode_fg)"
        readonly copy_mode_fg="$(get_tmux_option "@copy_mode_fg" $default_copy_mode_fg)"
        readonly bg="$(get_tmux_option "@bg" $default_bg)"

        prefix_indicator="#[bg=${bg}]#{?client_prefix,#[fg=${prefix_mode_fg}]${prefix_pressed_text},#[fg=${normal_mode_fg}]${normal_mode_text}}"
        normal_or_copy_indicator="#[bg=${bg}]#{?pane_in_mode,#[fg=${copy_mode_fg}]${copy_mode_text},#[fg=${normal_mode_fg}]${insert_mode_text}}";
        echo -n "#[fg=${bg}]"
        echo -n "#[bg=${bg}] "
        echo -n $prefix_indicator "#[fg=${normal_mode_fg}]${separator}" $normal_or_copy_indicator
        echo "#[bg=${bg}] "
        return 0
}

main
