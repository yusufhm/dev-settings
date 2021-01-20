update docksal.env with following values:

DOCKSAL_NFS_PATH="/System/Volumes/Data"
DOCKSAL_DNS_DISABLED=1
DOCKSAL_DNS_DOMAIN=docksal

replace the following line in $HOME/.docksal/stacks/volumes-nfs.yml:
  # o: addr=${DOCKSAL_HOST_IP},vers=3,nolock,noacl,nocto,noatime,nodiratime,actimeo=1
  o: addr=host.docker.internal,vers=3,nolock,noacl,nocto,noatime,nodiratime,actimeo=1

setup dnsmasq
