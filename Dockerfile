FROM alpine as builder

RUN apk --no-cache add wget gzip squashfs-tools 

WORKDIR /home

ARG IMAGE_URL=https://firmware.ffmuc.net/next/other/gluon-ffmuc-v2022.5.2-next3-x86-64-rootfs.img.gz

RUN wget ${IMAGE_URL}
RUN gunzip -d $(ls *.img.gz)
RUN unsquashfs -d ./root $(ls *.img)

COPY rootfs/. ./root


FROM scratch
COPY --from=builder /home/root /

RUN mkdir /var/lock

RUN sed -i 's,/proc/sys/kernel/hostname,/etc/hostname,g' /usr/lib/lua/pretty_hostname.lua

EXPOSE 80 443 22

USER root

CMD ["/sbin/init"]
