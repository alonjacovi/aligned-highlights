# Aligning Faithful Interpretations with their Social Attribution

This repository has the code for the paper. The code here is a *simple and minimalistic* implementation of the contrastive highlights procedure described in the paper.

Paper link: https://arxiv.org/abs/2006.01067

Contact: alonjacovi at gmail (please feel free to contact me for any question or discussion)

![hey...](https://placehold.it/15/FF0000/000000?text=+)

Abstract:

> We find that the requirement of model interpretations to be *faithful* is vague and incomplete.
With interpretation by textual highlights as a case-study, we present several failures cases. Borrowing concepts from social science, we identify that the problem is a misalignment between the causal chain of decisions (causal attribution) and the attribution of human behavior to the interpretation (social attribution). We re-formulate faithfulness as an accurate attribution of causality to the model, and introduce the concept of *aligned faithfulness*: faithful causal chains that are aligned with their expected social behavior. The two steps of causal attribution and social attribution *together* complete the process of explaining behavior.
With this formalization, we characterize various failures of misaligned faithful highlight interpretations, and propose an alternative causal chain to remedy the issues. Finally, we implement highlight explanations of the proposed causal format using contrastive explanations. 

## Getting Started

This code is based on the AllenNLP library. After cloning this repo, create a new AllenNLP environment:

```bash
conda create -n <env-name> python=3.8
conda activate <env-name>
pip install allennlp==1.3.0
```

And then run these scripts:
```bash
bash download_ag.sh  # download the AG News dataset
bash train_sequence_classification.sh  # fine-tune a RoBERTa-Large model on AG News
```

Then, run the `contrastive_highlights.ipynb` jupyter notebook on the trained model to derive the contrastive highlights for it.


## Disclaimer

As mentioned, this code is deliberately kept as **simple and minimalistic** as possible to help understanding of the paper. If you wish to use the procedure to derive real interpretations, you will likely want to use additional techniques to:
1. Ensure that masked inputs are in-distribution for the model (e.g., via [Interpretation of NLP models through input marginalization](https://www.aclweb.org/anthology/2020.emnlp-main.255.pdf)), or use other manipulation that keeps the input in-distribution and removes the non-highlighted information.
2. Ensure that your highlight space is expressive enough for your needs. In this repo, for simplicity I only consider continuous highlights - but you may want to consider a larger or smaller highlight space (e.g., non-continuous, for an exponential space).

On replicating the examples from the paper:

Unfortunately, the exact examples in the paper are coupled to the model I used, which I cannot upload here. The model I used for the examples in the paper is fine-tuned `bert-base-cased`, and the model shown in the jupyter notebook's outputs is fine-tuned `roberta-large`. 


