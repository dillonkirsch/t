#!/bin/bash

if [ -z "$1" ]; then
    read -p "Please enter the repo in org/repo format (e.g., huggyllama/llama-7b): " repo
else
    repo=$1
fi

apt install sudo -y
apt update
apt upgrade -y
shell=BASH
wget https://repo.anaconda.com/archive/Anaconda3-2023.03-1-Linux-x86_64.sh -O ~/anaconda3.sh
bash ~/anaconda3.sh -b -p $HOME/anaconda3
/root/anaconda3/bin/conda init
source root/.bashrc
# curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
# apt install git-lfs
# git lfs install 
# mkdir /workspace/models
# mkdir /workspace/datasets
# cd /workspace/datasets
# git lfs install
# git clone https://huggingface.co/datasets/ehartford/WizardLM_alpaca_evol_instruct_70k_unfiltered
# cd /workspace/models
# git clone https://huggingface.co/"$repo"
# cd /workspace
# git clone https://github.com/nlpxucan/WizardLM.git
# cd /workspace
# conda create -n llamax python=3.10
# conda activate llamax
# git clone https://github.com/AetherCortex/Llama-X.git
# cd Llama-X/src
# conda install pytorch==1.12.0 torchvision==0.13.0 torchaudio==0.12.0 cudatoolkit=11.3 -c pytorch
# git clone https://github.com/huggingface/transformers.git
# cd transformers
# pip install -e .
# cd ../..
# pip install -r requirements.txt
# apt install sudo -y
# apt update
# apt upgrade -y
# curl -L "https://repo.anaconda.com/archive/Anaconda3-2023.03-1-Linux-x86_64.sh" --output ana.sh
# chmod +x ./ana.sh
# ./ana.sh
# /root/anaconda3/bin/conda init
# source ~/.bashrc
# curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
# apt install git-lfs
# git lfs install 
# mkdir /workspace/models
# mkdir /workspace/datasets
# cd /workspace/datasets
# git lfs install
# git clone https://huggingface.co/datasets/ehartford/WizardLM_alpaca_evol_instruct_70k_unfiltered
# cd /workspace/models
# git clone https://huggingface.co/huggyllama/llama-7b
# cd /workspace
# conda create -n llamax python=3.10
# conda activate llamax
# git clone https://github.com/AetherCortex/Llama-X.git
# cd Llama-X/src
# conda install pytorch==1.12.0 torchvision==0.13.0 torchaudio==0.12.0 cudatoolkit=11.3 -c --yes pytorch
# git clone https://github.com/huggingface/transformers.git
# cd transformers
# pip install -e .
# cd ../..
# pip install -r requirements.txt
