# Allelic Variant Explorer demo

[![Docker Automated build](https://img.shields.io/docker/automated/ave2/ave-demo.svg)](https://hub.docker.com/r/ave2/ave-demo/)

The [Allelic Variation Explorer](https://github.com/nlesc-ave/ave-rest-service) (AVE) is a web application to visualize (clustered) single-nucleotide variants across genomes. This demo includes a sample dataset of genomic variants in tomato genomes (reference: _Solanum lycopersicum str. Heinz 1706_, SL2.40 genome build, only 100kbp of chr. 6).

![Screenshot of Allelic Variation Explorer](https://github.com/nlesc-ave/ave-rest-service/raw/master/docs/screenshot.png)

## Dataset

The `data/` directory contains the input files as described in more details [here](https://github.com/nlesc-ave/ave-demo/blob/master/data/README.md).

## Deploy

```bash
# pull image from Docker Hub and run demo container
docker run --name demo -d -e EXTERNAL_URL=http://[host]:[port] -p [host_port]:[container_port] ave2/ave-demo

# stop demo container
docker stop demo
```

Set _host_=`127.0.0.1`, _port_=`8080`, _host_port_=`8080` and _container_port_=`80` and use the web application at http://127.0.0.1:8080.

_Q: Why do we need EXTERNAL_URL? It seems redundant: one can also pass -p [ip]:[host_port]:[container_port]. Moreover, port=host_port to make this work._

## Build (optional)

```bash
# build image locally if the pre-built image can't be downloaded from Docker Hub
docker build -t ave2/ave-demo .
```
