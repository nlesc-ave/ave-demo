# Allelic Variant Explorer demo

[![Docker Automated build](https://img.shields.io/docker/automated/ave2/ave-demo.svg)](https://hub.docker.com/r/ave2/ave-demo/)

The [Allelic Variation Explorer](https://github.com/nlesc-ave/ave-rest-service) (AVE) is a web application to visualize (clustered) single-nucleotide variants across genomes. This demo includes a sample dataset of genomic variants in tomato genomes (reference: _Solanum lycopersicum str. Heinz 1706_, SL2.40 genome build, only 100kbp of chr. 6).

![Screenshot of Allelic Variation Explorer](https://github.com/nlesc-ave/ave-rest-service/raw/master/docs/screenshot.png)

## Dataset

The `data/` directory contains the input files as described in more details [here](https://github.com/nlesc-ave/ave-demo/blob/master/data/README.md).

## Run

```bash
docker run -d -p 8080:80 ave2/ave-demo
```

The application will be available on http://&lt;hostname&gt;:8080

## Build (optional)

```bash
docker build -t ave2/ave-demo .
```
