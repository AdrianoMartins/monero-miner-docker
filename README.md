![Monero Logo](https://web.getmonero.org/img/monero-logo.png)

# Monero Miner with Docker Alpine

[![Docker Build Status](https://img.shields.io/docker/cloud/build/adrianomartins/monero-miner.svg?style=flat-square)](https://hub.docker.com/r/adrianomartins/monero-miner/) [![](https://images.microbadger.com/badges/image/adrianomartins/monero-miner.svg)](https://microbadger.com/images/giansalex/monero-miner "Get your own image badge on microbadger.com")

Image of latest [xmrig](https://github.com/xmrig/xmrig) version, built on Alpine.

## Run

For easy start, with default configuration.

```sh
docker run -d --restart=always adrianomartins/monero-miner
```

Use your own configuration.

- Create your [wallet](https://mymonero.com/)
- Choose a [pool](http://moneropools.com/) (default: `supportXMR`)
- Run container

```sh
docker run -d -e WALLET="{YOUR_WALLET_ID}" giansalex/monero-miner
```

|Environment       |     Description      |
|------------------|----------------------|
|WALLET            | Wallet Address       |
|POOL              | URL of mining server |

**Advanced**

You can customize [xmrig options](https://github.com/xmrig/xmrig#command-line-options).

```sh
docker run -d giansalex/monero-miner xmrig\
     -o pool.supportxmr.com:3333 \
     -u <YOUR_WALLET> \
     -k  \
     --cpu-priority=2
```

### Donate

- XMR: `465g43rwL8K3UGhhcAGTSSN5oCF9iwkAHGJn23EgT9QzJ5WfebJaHYk3JBAVpvH5GX5UxFLtiGx3oSRTVb9CD994LeJAAbd`
