var Peers = require("hyperboria-peers");
var fs = require('fs');

const getPeers = function () {
    return Peers.map(function (creds, path) {
        if (typeof creds.location !== 'undefined')
            delete creds.location;

        for (const peer in creds)
            if (creds.hasOwnProperty(peer))
                if (peer.indexOf('[') === -1)
                    return {
                        [peer]: creds[peer]
                    };
    });
}

const arrayToObject = function (array) {
    return array.reduce(function (result, item) {
        var key = Object.keys(item)[0];
        result[key] = item[key];
        return result;
    }, {});
}

peers = arrayToObject(getPeers('eu'));
var CONFIG = require("./cjdroute.conf");

CONFIG.interfaces.UDPInterface[0].connectTo = peers;

console.log(JSON.stringify(CONFIG));
