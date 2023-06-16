apt install sudo -y
apt update
apt upgrade -y
curl -L "https://repo.anaconda.com/archive/Anaconda3-2023.03-1-Linux-x86_64.sh" --output ana.sh
chmod +x ./ana.sh
./ana.sh
/root/anaconda3/bin/conda init
source ~/.bashrc
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
apt install git-lfs
git lfs install 
conda create -n llamax python=3.10
conda activate llamax
git clone https://github.com/AetherCortex/Llama-X.git
cd Llama-X/src
conda install pytorch==1.12.0 torchvision==0.13.0 torchaudio==0.12.0 cudatoolkit=11.3 -c pytorch
git clone https://github.com/huggingface/transformers.git
cd transformers
pip install -e .
cd ../..
pip install -r requirements.txt
