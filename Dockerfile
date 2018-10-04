FROM quay.io/uninett/jupyterhub-singleuser:20180703-0ff1eb6

MAINTAINER Anne Fouilloux <annefou@geo.uio.no>

# Install other packages
USER notebook

# Install requirements for Python 3
ADD environment.yml environment.yml

RUN conda env update -n root -f environment.yml

