if [ -z "$1" ]; then
    read -p "Please enter the model in org/repo format (e.g., huggyllama/llama-7b ): " repo
    read -p "Please enter the training in org/repo format (e.g., WizardLM/WizardLM-7B-V1.0 ): " training
    read -p "Please enter the daataset in org/repo format (e.g., WizardLM/WizardLM_evol_instruct_70k ): " dataset_download
    read -p "Please enter the JSON URL (e.g., https://huggingface.co/datasets/jondurbin/airoboros-gpt4/resolve/main/as_conversations.json ): " json_url

else
    repo=$1
    training=$2
    dataset_download=$3
    json_url=$4
fi
echo "Please Run:"
echo "shell=BASH && wget https://repo.anaconda.com/archive/Anaconda3-2023.03-1-Linux-x86_64.sh -O ~/anaconda3.sh && bash ~/anaconda3.sh -b -p $HOME/anaconda3 && /root/anaconda3/bin/conda init && source /root/.bashrc"
#conda config --set auto_activate_base false
#apt install sudo -y
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
apt update
apt upgrade -y
apt install git-lfs python3-full python3-pip nano pipx cmake build-essential -y
git lfs install
pipx install openai --include-deps
pipx install pymilvus --include-deps
pipx install datasets --include-deps
pipx install tqdm --include-deps
pipx install ensorboard --include-deps
pipx install tensorboardX --include-deps
pipx install clearml --include-deps
pipx install clearml-agent --include-deps
pipx install fastai --include-deps
pipx install fschat --include-deps
pipx install dataset --include-deps
pip install openai 
pip install pymilvus 
pip install datasets
pip install tqdm 
pip install tensorboard 
pip install tensorboardX
pip install clearml
pip install clearml-agent 
pip install fastai 
pip install fschat 
pip install dataset
pip install einops
echo 'export PATH=$PATH:/root/.local/bin' >> ~/.bashrc
pipx ensurepath
source ~/.bashrc
clearml-init
clearml-agent init
cd /workspace
git clone https://github.com/HazyResearch/flash-attention.git
cd flash-attention
python setup.py install
cd /workspace
git clone https://github.com/nlpxucan/WizardLM.git
git clone https://huggingface.co/"$repo"
git clone https://huggingface.co/"$training"
git clone https://huggingface.co/datasets/"$dataset_download"
wget $json_url
conda create -y -n llamax python=3.10
conda activate llamax
git clone https://github.com/AetherCortex/Llama-X.git
cd Llama-X/src
conda install -y pytorch==1.12.0 torchvision==0.13.0 torchaudio==0.12.0 cudatoolkit=11.3 -c pytorch
git clone https://github.com/huggingface/transformers.git
cd transformers
pip install -e .
cd ../..
pip install -r requirements.txt
cd /workspace/Llama-X/src
wget https://raw.githubusercontent.com/nlpxucan/WizardLM/main/WizardLM/src/infer_wizardlm13b.py
wget https://raw.githubusercontent.com/nlpxucan/WizardLM/main/WizardLM/src/inference_wizardlm.py
wget https://raw.githubusercontent.com/nlpxucan/WizardLM/main/WizardLM/src/train_freeform.py
wget https://raw.githubusercontent.com/nlpxucan/WizardLM/main/WizardLM/src/train_freeform.py
wget https://raw.githubusercontent.com/nlpxucan/WizardLM/main/WizardLM/src/weight_diff_wizard.py
cd /workspace
git clone https://github.com/lm-sys/FastChat.git
cd FastChat
pip3 install --upgrade pip
pip3 install -e .
wget https://raw.githubusercontent.com/dillonkirsch/t/main/test1.sh
chmod +x ./test1.sh




# pipx install clearml --include-deps
# pipx install datasets --include-deps
# pipx install dataset --include-deps
# pipx install fschat --include-deps
# pipx install clearml-agent --include-deps
# pip install datasets
# pip install dataset
# pip install fschat
# pip install clearml-agent
