#! /usr/bin/env bash
source config.sh

cd $POINTPILLARS_ROOT/second.pytorch/second && \
python pytorch/train.py train \
    --config_path="$CONFIG_PATH" \
    --model_dir="$MODEL_DIR/$MODEL_NAME" \
    --display_step=50 \
    --multi_gpu=True \
    --pretrained_path="$PRETRAINED_PATH"
#   --resume

