# Allelic Variant Explorer demo

Docker image of Allelic Variant Explorer application with a sample dataset

## Dataset

The files in the `data/` directory contains data for the first 100000 basepairs of chromosome 6 of the tomato genome.

## Run

```bash
docker run -d -p 8080:80 ave2/ave-demo
```

The application will be available on http://&lt;hostname&gt;:8080

## Build

```bash
docker build -t ave2/ave-demo .
```
