# Hyperboria peer check

The aim of this project is to provide regular node availability status, for the [hyperboria/peers](https://github.com/hyperboria/peers) project. This is achieved by:

- Using [Travis CI](https://travis-ci.org) as a build environment
- Compiling [cjdns](https://github.com/cjdelisle/cjdns) in the build container
- Generating a *cjdns* configuration file with all nodes using the [hyperboria-peers](https://www.npmjs.com/package/hyperboria-peers) npm module
- Starting the *cjdns* daemon and waiting 180 seconds for any outgoing peer connections
- Generating status for available and unavailable peers

Most of the awesome stuff happens in the above three mentioned projects, the current one simply provides the "glue".

## Status page

The status page is generated daily and available at [GitHub pages](https://lvlts.github.io/hyperboria-peer-check/).

## Known issues
Currently, **only IPv4 checks are performed**. For more information or suggestions see [issue #1](https://github.com/lvlts/hyperboria-peer-check/issues/1).
