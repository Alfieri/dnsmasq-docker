# dnsmasq Service in a Docker Container
[![GitHub issues](https://img.shields.io/github/issues/Alfieri/dnsmasq-docker.svg)](https://github.com/Alfieri/dnsmasq-docker/issues)
[![GitHub license](https://img.shields.io/github/license/Alfieri/dnsmasq-docker.svg)](https://github.com/Alfieri/dnsmasq-docker/blob/master/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/Alfieri/dnsmasq-docker.svg?label=Github%20stars)](https://github.com/Alfieri/dnsmasq-docker/stargazers)

![docker build](https://img.shields.io/docker/cloud/build/alfieri/dnsmasq.svg)
![docker build](https://img.shields.io/docker/cloud/automated/alfieri/dnsmasq.svg)
![image size](https://img.shields.io/microbadger/image-size/alfieri/dnsmasq.svg)
![layers](https://img.shields.io/microbadger/layers/alfieri/dnsmasq.svg)
![docker pulls](https://img.shields.io/docker/pulls/alfieri/dnsmasq.svg)
![docker Stars](https://img.shields.io/docker/stars/alfieri/dnsmasq.svg)

Small and simple DNS Server with dnsmasq and docker

## Info
> Dnsmasq provides network infrastructure for small networks: DNS, DHCP, router advertisement and network boot. It is designed to be lightweight...

from http://www.thekelleys.org.uk/dnsmasq/doc.html

### Supported Architectures
| Architecture | Tag |
| :----: | --- |
| x86-64 | latest |
| arm64 | arm64v8-latest |
| armhf | arm32v6-latest |

Special thanks to [Ricardo Amaral](https://stackoverflow.com/users/40480/ricardo-amaral) and his solution for multi arch build for Docker Hub on Stack Overflow https://stackoverflow.com/questions/54578066/how-to-build-a-docker-image-on-a-specific-architecture-with-docker-hub

### Additional Links
<a href="http://www.thekelleys.org.uk/dnsmasq/docs/dnsmasq-man.html">dnsmasq Manpage</a>


## Usage
There are two volumes to map. The `/etc/dnsmasq/` volume is for the two config files for configure local hosts and nameservers (see example-hosts.conf and example-nameservers.conf). The `/etc/dnsmasq.d/` is the standard config directory for confiugre additional stuff for dnsmasq. 

The dnsmasq start is created as Entrypoint so any additinal commandline parameter are passed through. So you can ether configure dnsmasq via commandline or via the `/etc/dnsmasq.d/` volume.


Important: dnsmasq requires the `NET_ADMIN` capabilities to run.

1. pull the image `docker pull alfieri/dnsmasq`
2. create the container    
   ` docker create --name dnsmasq --cap-add=NET_ADMIN
        -p 53:53/tcp -p 53:53/udp
        -v <host_dir>:/etc/dnsmasq -v <host_dir>:/etc/dnsmasq.d
        alfieri/dnsmasq `
3. start the created dnsmasq container `docker start dnsmasq`. If it raises an error see the troublshoot section for help.


## Troublshoot
If an error raises with something like this message

    ... listen 0.0.0.0:53: bind: address already in use

try to bind the docker port mappings to the exakt ip of the host like this `-p 123.456.789.111:53:53`
