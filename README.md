# Dockerised Peerflix with a VPN

## Install
`docker pull tombh/docker-peerflix-vpn`

## Run

```
bash
docker run \
  -v path/to/.opvn:/root/config.opvn \
  --rm \
  tombh/docker-peerflix-vpn 'magnet-link'
```
