-- if the `--config-file` CLI argument was specified, then that path will be used. If that path fails to load, then the defaults will be used instead.
-- If the environment variable `$WEZTERM_CONFIG_FILE` is set, it will be treated as the path to a configuration file.
-- On Windows: `wezterm.lua` from the directory that contains `wezterm.exe`.
-- `$HOME/.config/wezterm/wezterm.lua` (where `$HOME` is the home directory of the user)
-- `$HOME/.wezterm.lua` (where `$HOME` is the home directory of the user).
-- Ref: https://wezfurlong.org/wezterm/config/files.html

local wezterm = require 'wezterm';

return {
    font_size = 18.0
}
