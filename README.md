# dnsmasq Service in a Docker Container
Small and simple DNS Server with dnsmasq and docker

## Info
> Dnsmasq provides network infrastructure for small networks: DNS, DHCP, router advertisement and network boot. It is designed to be lightweight...

from http://www.thekelleys.org.uk/dnsmasq/doc.html

### Additional Links
<a href="http://www.thekelleys.org.uk/dnsmasq/docs/dnsmasq-man.html">dnsmasq Manpage</a>


## Usage
There are two volumes to map. The `/etc/dnsmasq/` volume is for the two config files for configure local hosts and nameservers (see example-hosts.conf and example-nameservers.conf). The `/etc/dnsmasq.d/` is the standard config directory for confiugre additional stuff for dnsmasq. 

The dnsmasq start is created as Entrypoint so any additinal commandline parameter are passed through. So you can ether configure dnsmasq via commandline or via the `/etc/dnsmasq.d/` volume.


Important: dnsmasq requires the `NET_ADMIN` capabilities to run.

1. pull the image `docker pull alfieri/dnsmasq`
2. create the container    
   `
   docker create --name dnsmasq --cap-add=NET_ADMIN
        -p 53:53/tcp -p 53:53/udp
        -v <host_dir>:/etc/dnsmasq -v <host_dir>:/etc/dnsmasq.d
        alfieri/dnsmasq
   `
3. start the created dnsmasq container `docker start dnsmasq`. If it raises an error see the troublshoot section for help.


## Troublshoot
If an error raises with something like this message

    ... listen 0.0.0.0:53: bind: address already in use

try to bind the docker port mappings to the exakt ip of the host like this `-p 123.456.789.111:53:53`
