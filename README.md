# Dockerised Peerflix with a VPN

[Peerflix](https://github.com/mafintosh/peerflix) is a torrent client that downloads a torrent and efficiently
streams any media found within it. Remember that torrenting pirated films is illegal!

This convenient docker image packages Peerflix with an OpenVPN client, so that you can easily torrent through a VPN
without the complexity of setting up NodeJS, OpenVPN, split traffic, etc, on your own machine.

## Install
`docker pull tombh/docker-peerflix-vpn`

pull the git repo to get the dockflix script

## Run

``` bash
dockflix -d /path/to/openvpn/dir -c config.ovpn -m --vlc "magnet:?..."
```

<!-- docker run \ -->
   <!-- -v /path/to/openvpn/config:/etc/openvpn --rm -it --cap-add=NET_ADMIN \ -->
   <!-- tombh/docker-peerflix-vpn -c config.ovpn -m "magnet:..." -->

This will automatically start vlc with the stream. Other options are `--mpv --mplayer` or set a custom player cmd with `--player "cmd"`.

See `dockflix --help` for more options

<!-- Then goto http://172.17.0.2:8888 in your browser to view the video stream. -->

## Developing

Build the image yourself by cloning this repo and running;

`docker build -t peerflix .`

Contributions welcome.
