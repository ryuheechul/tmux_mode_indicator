# tmux_mode_indicator

![normal insert img](https://raw.githubusercontent.com/dominikduda/tmux_mode_indicator/master/images/normal_insert.png)
![prefix insert img](https://raw.githubusercontent.com/dominikduda/tmux_mode_indicator/master/images/prefix_insert.png)
![normal copy img](https://raw.githubusercontent.com/dominikduda/tmux_mode_indicator/master/images/normal_copy.png)
![prefix copy img](https://raw.githubusercontent.com/dominikduda/tmux_mode_indicator/master/images/prefix_copy.png)

## Installation:
### Intallation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

```
set -g @plugin 'dominikduda/tmux_mode_indicator'
```
Hit prefix + I to fetch the plugin and source it then add format string to `status-right` (look at "Quick start" section for that).

### Manual Installation

Clone the repo:

    $ git clone https://github.com/dominikduda/tmux_mode_indicator ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/battery.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

Add format string to `status-right` (look at "Quick start" section for that).

## Quick start:
Put this in at the top of `.tmux.conf`:

    set -g status-right "#{tmux_mode_indicator}"

By default powerline characters are disabled for compatibility. If u want to enable them (an make plugin look like it looks on animation at the top) put this at the top of `.tmux.conf`:

    set -g @tmux_mode_indicator_left_edge_character ""
    set -g @tmux_mode_indicator_separator "✤"

