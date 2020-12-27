local transformer_model = "roberta-large";
local transformer_dim = 1024;

{
  "dataset_reader":{
    "type": "text_classification_json",
    "token_indexers": {
      "tokens": {
        "type": "pretrained_transformer",
        "model_name": transformer_model,
        "max_length": 512
      }
    },
    "tokenizer": {
      "type": "pretrained_transformer",
      "model_name": transformer_model
    }
  },
  "train_data_path": "data/agnews/train.jsonl",
  "validation_data_path": "data/agnews/dev.jsonl",
  "test_data_path": "data/agnews/test.jsonl",
  "evaluate_on_test": true,
  "model": {
    "type": "basic_classifier",
    "text_field_embedder": {
      "token_embedders": {
        "tokens": {
          "type": "pretrained_transformer",
          "model_name": transformer_model
        }
      }
    },
    "seq2vec_encoder": {
       "type": "bert_pooler",
       "pretrained_model": transformer_model,
       "dropout": 0.1,
    },
    "namespace": "tags"
  },
  "data_loader": {
    "batch_sampler": {
      "type": "bucket",
      "sorting_keys": ["tokens"],
      "batch_size" : 6
    }
  },
  "trainer": {
    "num_epochs": 20,
    patience: 5,
    "cuda_device" : 0,
    "validation_metric": "+accuracy",
    "learning_rate_scheduler": {
      "type": "slanted_triangular",
      "cut_frac": 0.06
    },
    "optimizer": {
      "type": "huggingface_adamw",
      "lr": 2e-6,
      "weight_decay": 0.1,
    }
  }
}
