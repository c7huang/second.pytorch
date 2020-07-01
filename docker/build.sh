#! /usr/bin/env bash
source config.sh

docker build . \
    --build-arg POINTPILLARS_ROOT="$POINTPILLARS_ROOT" \
    --build-arg NUSCENES_ROOT="$NUSCENES_ROOT" \
    -t pointpillars-standalone

