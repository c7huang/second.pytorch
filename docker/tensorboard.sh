#! /usr/bin/env bash
docker run \
    --name="tensorboard.$(whoami).$RANDOM" \
    -d \
    -p 0.0.0.0:6006:6006 \
    -v $1:/root/logdir \
    --rm \
    tensorflow/tensorflow \
    tensorboard --bind_all --logdir /root/logdir
