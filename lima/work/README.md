Start the VM using:

```sh
limactl start --tty=false --name=work config.yml
```

That will create the VM and provision.

Drop into a shell:

```sh
limactl shell work
```

Change password:

```sh
# Then change the password:
sudo passwd yusuf
```

Run playbook manually:

```sh
ansible-playbook -i /Users/yusuf/.lima/work/ansible-inventory.yaml playbook.yml -v
```
