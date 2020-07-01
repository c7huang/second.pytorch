#! /usr/bin/env bash
source config.sh

docker run \
    --name="pointpillars-standalone-2.$(whoami).$RANDOM" \
    --rm \
    -it \
    -v "$HOST_POINTPILLARS_ROOT":"$POINTPILLARS_ROOT" \
    -v "$HOST_NUSCENES_ROOT":"$NUSCENES_ROOT" \
    --gpus=all \
    --cpuset-cpus=0-35 \
    pointpillars-standalone

