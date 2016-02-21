#!/bin/sh

firewall() {
    iptables -F OUTPUT
    iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
    iptables -A OUTPUT -o lo -j ACCEPT
    iptables -A OUTPUT -o tap0 -j ACCEPT
    iptables -A OUTPUT -o tun0 -j ACCEPT
    iptables -A OUTPUT -p udp -m udp --dport 53 -j ACCEPT
    iptables -A OUTPUT -p tcp -m owner --gid-owner vpn -j ACCEPT
    iptables -A OUTPUT -p udp -m owner --gid-owner vpn -j ACCEPT
    iptables -A OUTPUT -j DROP
}

# Fail the entire script if any command fails
set -e

OPTIND=1         # Reset in case getopts has been used previously in the shell.
while getopts "c:m:" opt; do
    case "$opt" in
    m)  MAGNET=$OPTARG ;;
    c)  CONFIG=$OPTARG ;;
    esac
done
shift $((OPTIND-1))
# [ "$1" = "--" ] && shift

mkdir -p /dev/net
if [ ! -c /dev/net/tun ]; then
    mknod /dev/net/tun c 10 200
fi

# firewall

sg vpn -c "openvpn --config $CONFIG --daemon"

# wait for routing to be set
# sleep 15

# echo test
# ping google.com -c 1
# sg vpn -c "ping google.com -c 1"

peerflix $MAGNET
