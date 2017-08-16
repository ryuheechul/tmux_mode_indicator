[![donate_with_bitcoins](https://img.shields.io/badge/Bitcoin-Donate-ffc600.svg?logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAMAAAAolt3jAAABWVBMVEUAAAD1khf1jxf1kRb3kxf1khf3khf1kRf3khn3kRj3lRz3khj1kRj3kxj1kRj3kxj3liP1khj2kxj3kxv2khj3khn2khj2lyT2kxn4kxn5qUn2khn2mCf4oz72khn2khn2khn3khn3kxr3kxv3lBz3lB33lyP3lyT3mCX3min3mir3njP3nzX3oDX3oTj3oTr4oz34pUD4pUH4p0X4qUr4qkv4qk34sFj5slz5s175tGH5tWP5t2j5uGn5uWv5u3D5vXT6vXX6vnX6v3j6wX36wn%2F6w4H6xIL6xYX6yY37zZb7zZf7z5r70J370qH706P72a%2F82bD83bj837z84sL848T85cj85cr958z9583958796M796M%2F96dD96dL97dn97tz9793979798OD98uX%2B8%2Bb%2B9Oj%2B9er%2B9ez%2B9u3%2B9%2B7%2B%2BPD%2B%2B%2Fj%2B%2FPn%2B%2FPr%2B%2Ffv%2B%2Ffz%2B%2Fv7%2F%2Fv5cp9%2FiAAAAIHRSTlMANjc4a2xsbYSFhYaHwsTExMXX19jY2dnc3Nzd3d3z9P0zBPsAAAC8SURBVAjXBcHJbsIwFAXQaz%2BTBDKQMIiKKquKZf%2F%2FT7pBbBokUIUQJrExeXbccwQAylQV7OgmQABptXeHMNkf7aGQfqy%2FYn1LfJVfmKjJWLQFrd%2FSRKfmBYKl62l5qEdhJQGxSt3z0hcqztQCoFKuvuXm14hcSsQktyctIhtA2rja1%2Frv2PGuhFE827VZ9vlqkiGAKcDrhW%2B3DZ%2Bvj0GFPk%2F4LLtXuPshEoLjaZTd0%2BgbQwCgOZWx5%2FcE%2FAPW1Fv3gHREswAAAABJRU5ErkJggg%3D%3D)](https://blockchain.info/payment_request?address=1DMdu2m8qX4svMdsnPjRevh2wvxCy2hy8n&message=dominikduda)

![logo_with_title](https://raw.githubusercontent.com/dominikduda/config_files/master/logo_with_title.png)

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

## Donations

If you like the plugin, you can thank me by sending BTC to following address: **1DMdu2m8qX4svMdsnPjRevh2wvxCy2hy8n**

