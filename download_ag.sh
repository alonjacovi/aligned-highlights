#!/usr/bin/env bash

mkdir -p $(pwd)/data/agnews
curl -Lo $(pwd)/data/agnews/train.jsonl https://s3-us-west-2.amazonaws.com/allennlp/datasets/ag-news/train.jsonl
curl -Lo $(pwd)/data/agnews/dev.jsonl https://s3-us-west-2.amazonaws.com/allennlp/datasets/ag-news/dev.jsonl
curl -Lo $(pwd)/data/agnews/test.jsonl https://s3-us-west-2.amazonaws.com/allennlp/datasets/ag-news/test.jsonl
