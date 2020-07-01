#! /usr/bin/env bash
source config.sh

cd $POINTPILLARS_ROOT/second.pytorch/second && \
python pytorch/train.py evaluate \
    --config_path="$CONFIG_PATH" \
    --model_dir="$MODEL_DIR/$MODEL_NAME"

