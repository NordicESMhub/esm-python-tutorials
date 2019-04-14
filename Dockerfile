FROM quay.io/uninett/jupyterhub-singleuser:20181130-4da7986

MAINTAINER Anne Fouilloux <annefou@geo.uio.no>

# Install packages
USER root
RUN apt-get update && apt-get install -y dvipng latexmk texlive vim

# Install other packages
USER notebook

# Install requirements for Python 3
ADD jupyterhub_environment.yml jupyterhub_environment.yml

RUN conda env update -f jupyterhub_environment.yml

RUN cp /opt/conda/lib/libhdf5.so.103 /opt/conda/lib/libhdf5.so.101

RUN /opt/conda/bin/jupyter labextension install @jupyterlab/hub-extension @jupyter-widgets/jupyterlab-manager
RUN /opt/conda/bin/nbdime extensions --enable
RUN /opt/conda/bin/jupyter labextension install jupyterlab-datawidgets nbdime-jupyterlab dask-labextension
RUN /opt/conda/bin/jupyter labextension install @jupyter-widgets/jupyterlab-sidecar
