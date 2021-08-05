FROM nvidia/cuda:11.1.1-cudnn8-runtime-ubuntu20.04

ENV TZ=Europe

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get update && \
    apt-get install -y python3-dev python3-pip build-essential git cmake byobu graphviz && \
    apt-get autoremove && apt-get clean && \
    pip3 install torch==1.8.1+cu111 torchvision==0.9.1+cu111 torchaudio==0.8.1 -f https://download.pytorch.org/whl/torch_stable.html && \
    rm -r /root/.cache/pip


RUN pip3 install numpy scipy h5py && \
    pip3 install pillow scikit-image graphviz && \
    pip3 install matplotlib seaborn visdom arviz && \
    pip3 install pandas scikit-learn && \
    pip3 install tqdm nvidia-ml-py ipdb && \
    pip3 install jupyterlab && \
    pip3 install tensorflow-gpu tensorflow-probability tensorboard pymc3  && \
    rm -r /root/.cache/pip


EXPOSE 8888 6006 8097

WORKDIR /root/work

CMD jupyter-lab --port=8888 --ip=0.0.0.0 --no-browser --allow-root
