Start the VM using:

```sh
limactl start --tty=false --name=limabox config.yml
```

Drop into a shell:

```sh
limactl shell limavm
```

Unlock user password:

```sh
# Drop into shell and do:
sudo passwd -u yusuf

# Then change the password:
sudo passwd yusuf
```
