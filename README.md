A repository to capture my must-have configs.

## Requirements
  - [homebrew](https://brew.sh/)
  - [ahoy](https://github.com/ahoy-cli/ahoy)
  - [colima](https://github.com/abiosoft/colima)

## Set up colima.

After colima is [installed](https://github.com/abiosoft/colima#installation), symlink
the default instance's config and start it.
```sh
mkdir -p ~/.colima/default
ln -s ~/dev-settings/colima-default.yaml ~/.colima/default/colima.yaml
colima start
```

Set up VSCode for Remote SSH:

  1. Click on the Remote Explorer icon on the left
  2. Click on the cog (Configure)
  3. Click on Settings (specify a custom configuration file)
  4. Set `~/.colima/ssh_config` as the Config File
