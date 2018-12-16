FROM quay.io/uninett/jupyterhub-singleuser:20181022-270e4f8

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

