#!/usr/bin/env bash

DATASET="agnews"
MODEL_PATH="experiments/models/${DATASET}/roberta-large"
CUDA_GPU=0

CUDA_VISIBLE_DEVICES=${CUDA_GPU} allennlp train training_configs/${DATASET}.jsonnet \
  -s "${MODEL_PATH}" -f
