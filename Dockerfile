FROM quay.io/uninett/jupyterhub-singleuser:20181022-270e4f8

MAINTAINER Anne Fouilloux <annefou@geo.uio.no>

# Install other packages
USER notebook

# Install requirements for Python 3
ADD jupyterhub_environment.yml jupyterhub_environment.yml

RUN conda env update -f jupyterhub_environment.yml
