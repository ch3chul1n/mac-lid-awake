# mac-lid-awake ☕️/💤

A tiny [SwiftBar](https://github.com/swiftbar/SwiftBar) plugin that adds a menu bar toggle to keep your Mac **awake with the lid closed** — handy for leaving long-running jobs (builds, AI agents, downloads…) working while the laptop is shut.

- ☕️ — sleep disabled: the Mac stays awake even with the lid closed
- 💤 — normal behaviour: the Mac sleeps when you close the lid

Under the hood it just toggles `pmset -a disablesleep 1|0` and reads the current state from `pmset -g`.

## Install

1. Install SwiftBar:
   ```sh
   brew install --cask swiftbar
   ```
2. Copy the plugin into your SwiftBar plugin folder and make it executable:
   ```sh
   cp sleeptoggle.5s.sh ~/swiftbar-plugins/
   chmod +x ~/swiftbar-plugins/sleeptoggle.5s.sh
   ```
   (`5s` in the filename = refresh every 5 seconds.)
3. Allow `pmset` to run with `sudo` without a password prompt (SwiftBar can't type it for you):
   ```sh
   echo "$(whoami) ALL=(root) NOPASSWD: /usr/bin/pmset" | sudo tee /etc/sudoers.d/pmset
   sudo chmod 440 /etc/sudoers.d/pmset
   sudo visudo -c   # verify syntax
   ```
   This only grants passwordless access to `/usr/bin/pmset`, nothing else.

## ⚠️ Notes

- With sleep disabled, a closed MacBook in a bag can get **hot** and drain the battery. Switch back to 💤 when you're done.
- The setting persists across reboots until you toggle it back.
- To revert manually: `sudo pmset -a disablesleep 0`.
- To uninstall: delete the plugin file and `sudo rm /etc/sudoers.d/pmset`.

## License

MIT
