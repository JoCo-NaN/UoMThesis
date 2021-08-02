FROM marccote19/textworld:v1.2
#RUN apt update
#RUN apt-get update

RUN pip uninstall textworld -y
RUN pip uninstall gym tqdm numpy docker spacy textworld -y
RUN rm -r TextWorld
RUN git clone https://github.com/JohnnySun8/TextWorld.git
RUN cd TextWorld/
RUN pip install TextWorld/.
RUN pip install torch==1.9.0+cu102 torchvision==0.10.0+cu102 torchaudio===0.9.0 -f https://download.pytorch.org/whl/torch_stable.html

