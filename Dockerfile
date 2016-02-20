# Alpine is a lightweight Linux
FROM mhart/alpine-node:5.6.0

# Update latest available packages
RUN apk update

# Install OpenVPN
RUN apk add openvpn

# Install Peerflix
RUN npm install peerflix

# Clean any non essential files to save space
RUN rm -rf /var/cache/apk/*

COPY init.sh /usr/bin

ENTRYPOINT ["init.sh"]
