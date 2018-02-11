#!/bin/bash
die() { echo "$*" 1>&2 ; exit 1; }

pushd cjdns
./do || die "[-] Build failed";
popd

echo "[+] generating default cjdns configuration"
echo "module.exports = " > cjdroute.conf
cjdns/cjdroute --genconf | tee -a cjdroute.conf

echo "[+] adding current peers (hyperboria/peers) to current configuration"
node main.js | tee cjdroute.conf

echo "[+] starting cjdns"
cjdns/cjdroute < cjdroute.conf

echo "[+] waiting for connection"
sleep 30

ps -ef | grep cjd
cjdns/tools/peerStats
