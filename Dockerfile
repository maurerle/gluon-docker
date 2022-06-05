FROM scratch
ADD ./build /

RUN mkdir /var/lock
#RUN mkdir /var/lock && \
#    opkg update && \
#    opkg install curl \
#                 jq \
#                 luci \
#                 luci-ssl

EXPOSE 80 443 22

USER root

CMD ["/sbin/init"]
