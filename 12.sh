if [ -z "$1" ]; then
    read -p "Please enter the model in org/repo format (e.g., huggyllama/llama-7b): " repo
    read -p "Please enter the training in org/repo format (e.g., WizardLM/WizardLM-7B-V1.0): " training
    read -p "Please enter the daataset in org/repo format (e.g., WizardLM/WizardLM_evol_instruct_70k): " dataset_download
else
    repo=$1
    training=$2
    dataset_download=$3
fi
echo "Please Run:"
echo "shell=BASH && wget https://repo.anaconda.com/archive/Anaconda3-2023.03-1-Linux-x86_64.sh -O ~/anaconda3.sh && bash ~/anaconda3.sh -b -p $HOME/anaconda3 && /root/anaconda3/bin/conda init && source /root/.bashrc"
conda deactivate
conda config --set auto_activate_base false
apt install sudo -y
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
apt update
apt upgrade -y
apt install git-lfs python3-full nano pipx -y
git lfs install
pipx install clearml
pipx install datasets
pipx ensurepath
source ~/.bashrc
clearml-init
cd /workspace
git clone https://github.com/nlpxucan/WizardLM.git
git clone https://huggingface.co/"$repo"
git clone https://huggingface.co/"$training"
git clone https://huggingface.co/datasets/"$dataset_download"
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
python weight_diff_wizard.py recover --path_raw /workspace/$repo/ --path_diff /workspace/$training/ --path_tuned /workspace/$repo_tuned
