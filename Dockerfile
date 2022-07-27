FROM python:3.8

LABEL NAME="python-3.8" \
      VERSION="3.8" \
      DESC="Python3.8 container"
      
# Set HTTP(S) proxy server:
ENV http_proxy http://host.docker.internal:3128
ENV https_proxy http://host.docker.internal:3128
