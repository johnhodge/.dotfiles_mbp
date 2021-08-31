# dotfiles_mbp 💻

Install everything, and set up all the system preferences soon too.

## Install

```zsh
gh repo clone johnhodge/dotfiles_mbp && cd .dotfiles && ./install
```

## Manual steps

- MacOS preferences
  - Magic mouse left click
  - Natural scroll off
  - Group windows in launchpad
  - Don't reorganize launchpad
  - Set screenshots folder to be in OneDrive
  - Turn off keyboard shortcut for spotlight
- Install synology drive

  - Set sync method
  - Update the file `.SynologyDrive/data/session/1/conf/blacklist.filter` to

    ```sh
    [directory]
    black_name="node_modules"
    ```
