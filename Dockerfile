FROM marccote19/textworld:v1.2
#RUN apt update
#RUN apt-get update

RUN pip uninstall textworld -y
RUN pip uninstall gym tqdm numpy docker spacy textworld -y
RUN pip install https://github.com/JohnnySun8/TextWorld/archive/refs/heads/master.zip
RUN pip install torch==1.9.0+cu102 torchvision==0.10.0+cu102 torchaudio===0.9.0 -f https://download.pytorch.org/whl/torch_stable.html

