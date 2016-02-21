#!/bin/sh

# Fail the entire script if any command fails
set -e

OPTIND=1         # Reset in case getopts has been used previously in the shell.
while getopts "c:m:" opt; do
    case "$opt" in
    m)  MAGENT=$OPTARG
        ;;
    c)  CONFIG=$OPTARG
        ;;
    esac
done
shift $((OPTIND-1))
# [ "$1" = "--" ] && shift

mkdir -p /dev/net
if [ ! -c /dev/net/tun ]; then
    mknod /dev/net/tun c 10 200
fi

openvpn --config $CONFIG --daemon

peerflix $MAGENT
