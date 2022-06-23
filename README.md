# gluon-docker
Experiments to dockerize a gluon - based on openwrt docker


The output looks kind of like this:
```
➜  gluon-docker git:(main) docker run -p 8080:80 -p 2222:22 gluon
/etc/preinit: line 5: can't create /sys/devices/system/cpu/microcode/reload: Read-only file system
RTNETLINK answers: Operation not permitted
RTNETLINK answers: Operation not permitted
Press the [f] key and hit [enter] to enter failsafe mode
Press the [1], [2], [3] or [4] key and hit [enter] to select the debug level
Failed to send flush request: Operation not permitted
RTNETLINK answers: Operation not permitted
```

Which is normal as the container is not allowed to change kernel settings.
SSH and Web-Interface still works. After using the setup wizard the container terminates at the moment.
This could be caused by the intended reboot after setup.

Applied a workaround here: `/proc/sys/kernel/hostname` replaced with `/tmp/hostname` 

## instructions

### docker-compose

1. execute `docker-compose up -d`
2. `ssh -p 2222 root@localhost`
3. `uci show`
4. browser http://localhost:8080/cgi-bin/config/wizard

### manual docker build

1. execute `docker build . -t gluon`
2. run the docker container `docker run -p 8080:80 -p 2222:22 gluon`

3. `ssh -p 2222 root@localhost`
4. `uci show`
5. browser http://localhost:8080/cgi-bin/config/wizard

opkg update works but it is not that useful as it is now


## sources

https://openwrt.org/docs/guide-user/virtualization/docker_openwrt_image

https://github.com/openwrt/docker
