<img src="https://raw.githubusercontent.com/dominikduda/config_files/master/dd_logo_blue_bg.png" width="300" height="300" />

# tmux_mode_indicator

![normal insert img](https://raw.githubusercontent.com/dominikduda/tmux_mode_indicator/master/images/normal_insert.png)
![prefix insert img](https://raw.githubusercontent.com/dominikduda/tmux_mode_indicator/master/images/prefix_insert.png)
![normal copy img](https://raw.githubusercontent.com/dominikduda/tmux_mode_indicator/master/images/normal_copy.png)
![prefix copy img](https://raw.githubusercontent.com/dominikduda/tmux_mode_indicator/master/images/prefix_copy.png)

Plugin indicating normal/insert/prefix/copy modes. It is also available as segment for [tmux-powerline](https://github.com/erikw/tmux-powerline).

## Installation:
### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

```
set -g @plugin 'dominikduda/tmux_mode_indicator'
```
Hit prefix + I to fetch the plugin and source it then add format string to `status-right` (look at [quick start](#quick-start) section for that).

### Manual Installation

Clone the repo:

    $ git clone https://github.com/dominikduda/tmux_mode_indicator ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/tmux_mode_indicator.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

Add format string to `status-right` (look at [quick start](#quick-start) section for that).


## Quick start
Put this in at the top of `.tmux.conf`:

    set -g status-right "#{tmux_mode_indicator}"

By default powerline characters are disabled for compatibility. If u want to enable them (an make plugin look like it looks on screens at the top) put this at the top of `.tmux.conf`:

    set -g @tmux_mode_indicator_left_edge_character ""
    set -g @tmux_mode_indicator_separator "✤"

## Other plugins/functions integration

If you want to display something else in the right status just add it before/after `#{tmux_mode_indicator}`:

    set -g status-right '%d/%m #{tmux_mode_indicator} %H:%M:%S'

It will produce following right status (if u set powerline characters as [quick start](#quick-start) says):

![example right status](https://raw.githubusercontent.com/dominikduda/tmux_mode_indicator/master/images/tmux_mode_indicator_with_date_and_hour.png)

You can make it colorful:

    set -g @tmux_mode_indicator_left_edge_character ""
    set -g @tmux_mode_indicator_separator "✤"
    set -g @tmux_mode_indicator_background "colour33"
    set -g @tmux_mode_indicator_right_edge_character ""
    set -g @tmux_mode_indicator_right_edge_character_fg "#8dc062"
    set -g @tmux_mode_indicator_left_edge_character_bg "#deb863"
    set -g @tmux_mode_indicator_after_interpolation_bg "#8dc062"
    set -g @tmux_mode_indicator_after_interpolation_fg "#000000"

    set -g status-right "#[bg=#626262,fg=#deb863]#[bg=#deb863,fg=#000000] %d/%m #{tmux_mode_indicator} %H:%M:%S "

It will produce following right status:

![example right status](https://raw.githubusercontent.com/dominikduda/tmux_mode_indicator/master/images/tmux_mode_indicator_with_date_and_hour_pretty.png)

For API information see [customization](#customization) section.

## Potential issues solutions:

Plugin is cut on the right side? Enlarge `status-right-length`

    set-option -g status-right-length 300

Plugin updates slowly? Set set tmux status update time (`tmux-status-interval`) to 1 second.

    set -g status-interval 1

## Customization

##### All customizations listed below should be pasted at the top of your `.tmux.conf`

Notes:
- Some characters are tmux-special-characters and may not work.
- Colors can be passed in tmux format (`color232`) of hex format (`#ffffff`)

Change text displayed when in copy mode

    set -g @tmux_mode_indicator_copy_mode_text "INTERESTING PHRASE"

Change text displayed after pressing prefix

    set -g @tmux_mode_indicator_prefix_pressed_text "SMART WORD"

Change text displayed when in insert mode

    set -g @tmux_mode_indicator_insert_mode_text "CATCHY JOKE"

Change text displayed when in normal mode

    set -g @tmux_mode_indicator_normal_mode_text "FUNNY SAMPLE TEXT"

Change separator

    set -g @tmux_mode_indicator_separator "XD"

Change character displayed on left edge of the indicator

    set -g @tmux_mode_indicator_left_edge_character "X"

Change character displayed on right edge of the indicator (by default empty string, useful when you want to display something else after tmux_mode_indicator)

    set -g @tmux_mode_indicator_right_edge_character "X"

Change background color of tmux_mode_indicator

    set -g @tmux_mode_indicator_background "colour2"

Change color of text displayed when in copy mode

    set -g @tmux_mode_indicator_copy_mode_fg "#ffffff"

Change color of text displayed when prefix is pressed

    set -g @tmux_mode_indicator_prefix_pressed_fg "colour3"

Change default text color

    set -g @tmux_mode_indicator_normal_fg "#ff00ff"

Change background color of character displayed on left edge of the indicator (useful when you want to display something with specific colors after tmux_mode_indicator)

    set -g @tmux_mode_indicator_left_edge_character_bg "colour5"

Change separator color

    set -g @tmux_mode_indicator_separator_fg "colour5"

Change color of text displayed after tmux_mode_indicator (useful when you want to display something with specific colors after tmux_mode_indicator)

    set -g @tmux_mode_indicator_after_interpolation_fg "#ffff00"

Change background color of text displayed after tmux_mode_indicator (useful when you want to display something with specific colors after tmux_mode_indicator)

    set -g @tmux_mode_indicator_after_interpolation_bg "colour6"

Change background color of character displayed on right edge of the indicator (useful when you want to display something with specific colors after tmux_mode_indicator)

    set -g @tmux_mode_indicator_right_edge_character_bg "#ff0000"

Change color of character displayed on right edge of the indicator (useful when you want to display something with specific colors after tmux_mode_indicator)

    set -g @tmux_mode_indicator_right_edge_character_fg "#colour7"
