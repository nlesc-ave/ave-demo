# Allelic Variant Explorer demo

[![Docker Automated build](https://img.shields.io/docker/automated/ave2/ave-demo.svg)](https://hub.docker.com/r/ave2/ave-demo/)

The Allelic Variation Explorer web application visualizes clusters of genomic variants.

![Screenshot of Allelic Variation Explorer](https://github.com/nlesc-ave/ave-rest-service/raw/master/docs/screenshot.png)

This is a Docker image of [Allelic Variant Explorer](https://github.com/nlesc-ave/ave-rest-service) application with a sample dataset.

## Dataset

The files in the `data/` directory contains data for the first 100000 basepairs of chromosome 6 of the Tomato genome.
The construction of the dataset is described at https://github.com/nlesc-ave/ave-demo/blob/master/data/README.md .

## Run

```bash
docker run -d -e EXTERNAL_URL=http://$(hostname):8080 -p 8080:80 ave2/ave-demo
```

The application will be available on http://&lt;hostname&gt;:8080

The hostname should be resolvable by the web browser and the Docker container, if not use the ip-adress.

## Build

```bash
docker build -t ave2/ave-demo .
```
