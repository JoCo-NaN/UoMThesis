FROM marccote19/textworld:v1.2
RUN apt update
RUN apt install python3.7 -y
RUN  python3.7 -m pip -q install pip --upgrade

RUN python3.7 -m pip uninstall textworld -y
RUN python3.7 -m pip uninstall gym tqdm numpy docker textworld -y
RUN python3.7 -m pip install textworld==1.1.1
RUN python3.7 -m pip install torchvision
