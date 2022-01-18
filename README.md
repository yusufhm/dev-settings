A repository to capture my must-have configs.

## Requirements
  - [homebrew](https://brew.sh/)
  - [ahoy](https://github.com/ahoy-cli/ahoy)
  - [multipass](https://multipass.run/)

## Set up multipass vm.
```sh
multipass launch --cpus 4 --disk 50G --mem 4G --name dev --cloud-init ~/dev-settings/multipass-cloud-init.yml
```
