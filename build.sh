#!/bin/bash

IMAGE=mysql:v5.7

echo Building $IMAGE
docker build -f Dockerfile -t $IMAGE ./
