# Alpine is a lightweight Linux
FROM mhart/alpine-node:5.6.0

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Update latest available packages
RUN apk update

# Install OpenVPN
RUN apk add openvpn bash shadow@testing

# Install Peerflix
RUN npm install -g peerflix

# Clean any non essential files to save space
RUN rm -rf /var/cache/apk/* /tmp/*

RUN addgroup -S vpn

WORKDIR /etc/openvpn

COPY init.sh /usr/bin

ENTRYPOINT ["init.sh"]
