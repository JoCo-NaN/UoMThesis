FROM marccote19/textworld:v1.1
RUN pip3 -q install pip --upgrade


RUN python3 -m spacy download en
RUN pip3 install torchvision

