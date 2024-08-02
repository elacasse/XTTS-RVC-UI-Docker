#!/bin/bash

docker buildx build --pull --platform linux/amd64 --push -t "ericlacasse/xtts-rvc-ui:main" --provenance false -f Dockerfile .