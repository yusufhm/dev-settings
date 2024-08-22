Start the VM using:

```sh
limactl start --tty=false --name=work config.yml
```

That will create the VM and provision.

Replace the create lima config with a symlink to this repo:
```sh
mv ~/.lima/work/lima.yaml ~/.lima/work/lima.yaml.bak
ln -s ~/dev-settings/lima/work/lima.yml ~/.lima/work/lima.yaml
```

Drop into a shell:

```sh
limactl shell work
```

Run playbook manually:

```sh
ansible-playbook -i ~/.lima/work/ansible-inventory.yaml ~/dev-settings/playbooks/provision-lima.yml -v
```
