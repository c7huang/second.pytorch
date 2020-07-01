#! /usr/bin/env bash
source config.sh

cd $POINTPILLARS_ROOT/second.pytorch/second && \
python create_data.py nuscenes_data_prep \
    --root_path="$NUSCENES_ROOT/$VERSION" \
    --version="$VERSION" \
    --dataset_name="$DATASET_NAME" \
    --max_sweeps=$MAX_SWEEPS

