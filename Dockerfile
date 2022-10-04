# kaggleのpython環境をベースにする
FROM gcr.io/kaggle-gpu-images/python:v121


RUN apt-get update && apt-get install -y python3 python3-pip
# RUN pip install jupyterlab

RUN pip install -U pip && \
  pip install transformers==4.22.2 tokenizers==0.12.1 sentencepiece==0.1.96 datasets==2.1.0 python-dotenv slackclient

RUN pip install --upgrade --force-reinstall --no-deps kaggle && \
    pip install --upgrade wandb

RUN conda install -y \
  nodejs

#tqdm
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension \
  && jupyter labextension install @jupyter-widgets/jupyterlab-manager

EXPOSE 8888