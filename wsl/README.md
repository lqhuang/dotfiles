# Config for WSL

Two files are required to configure WSL.

- `/etc/wsl.conf`: WSL configuration file inside distribution
  - configurable options: `boot`(`systemd`), `automount`, `network`, `interop`,
    `user`
- `%UserProfile%\.wslconfig`: WSL configuration file for Windows
  - configurable options
    - `[wsl2]` - networking, firewall, dns, proxy, etc.
    - `[experimental]`

Both files do not exist by default.

Refs:

- [Advanced settings configuration in WSL](https://learn.microsoft.com/en-us/windows/wsl/wsl-config)
