# Kanata

This directory contains the kanata configuration for macOS, as well as a 
launchctl configuration to enable this to run as a LaunchAgent or LaunchDaemon.

### Copy this file to your LaunchDaemons folder.

```
sudo cp ./com.astorayestas.kanata.plist /Library/LaunchDaemons
```
### Create a user to the kanata script on OS launch

```sh
echo "$(whoami) ALL=(ALL) NOPASSWD: /Users/astorayestas/.cargo/bin/kanata" | sudo tee "/etc/sudoers.d/kanata" >/dev/null
```

### Once copied over, load the script using sudo 

```sh
sudo launchctl load -w /Library/LaunchDaemons/com.astorayestas.kanata.plist
sudo launchctl start com.astorayestas.kanata
sudo launchctl list | grep kanata
```

### add your kanata binary to system 
- settings -> privacy security -> input monitoring

### Now, kanata should be running when the Macbook starts up!

## Home row keys

| Remap key             |           key            |
| --------------------- | :----------------------: |
| `a` -> `left command` | <kbd>⌘</kbd>             |
| `s` -> `left option` | <kbd>⌥</kbd> |
| `d` -> `left shift` | <kbd>shift</kbd> |
| `f` -> `left control` | <kbd>⌃</kbd> |
| `j` -> `right control` | <kbd>⌃</kbd> |
| `k` -> `right shift` | <kbd>shift</kbd> |
| `l` -> `right option` | <kbd>⌥</kbd> |
| `;` -> `right command` | <kbd>⌘</kbd>             |
