#! /usr/bin/env bash

export CUDA_VISIBLE_DEVICES=0,1,2,3

POINTPILLARS_ROOT=/root/pointpillars
NUSCENES_ROOT=/root/nuscenes

HOST_POINTPILLARS_ROOT=/path/to/pointpillars
HOST_NUSCENES_ROOT=/path/to/nuscenes

VERSION="v1.0-trainval"
DATASET_NAME="NuScenesDatasetVelo"
MAX_SWEEPS=10

MODEL_NAME=car.ped.pp.lowa
CONFIG_PATH="$POINTPILLARS_ROOT/configs/car.ped.pp.lowa.config"
MODEL_DIR="$POINTPILLARS_ROOT/models"
PRETRAINED_PATH="$POINTPILLARS_ROOT/pretrained_models_v1.5/pp_model_for_nuscenes_pretrain/voxelnet-296960.tckpt"
