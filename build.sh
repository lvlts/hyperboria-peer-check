#!/bin/bash
die() { echo "$*" 1>&2 ; exit 1; }

node --version

pushd cjdns
./do || die "[-] Build failed";
popd

echo "[+] generating default cjdns configuration"
echo -n "module.exports = " > cjdroute.conf
cjdns/cjdroute --genconf | tee -a cjdroute.conf

echo "[+] adding current peers (hyperboria/peers) to current configuration"
./main | tee cjdroute.populated.conf

echo "[+] starting cjdns"
cjdns/cjdroute < cjdroute.populated.conf || die "Unable to start cjdns"

echo "[+] waiting for connection (180s)"
sleep 180

mkdir -p out
./peerStats > out/index.md
