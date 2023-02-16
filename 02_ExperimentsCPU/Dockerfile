FROM debian:buster-slim
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
&& apt-get -y install --no-install-recommends build-essential libhdf5-dev pkg-config protobuf-compiler cython3 \
&& apt-get -y install --no-install-recommends python3 python3-dev python3-pip python3-wheel python3-opencv \
&& apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*
RUN pip3 install --no-cache-dir setuptools==54.0.0
RUN pip3 install --no-cache-dir https://github.com/bitsy-ai/tensorflow-arm-bin/releases/download/v2.4.0/tensorflow-2.4.0-cp37-none-linux_aarch64.whl
ARG USERNAME=mluser
ARG USERID=1000
RUN useradd --system --create-home --shell /bin/bash --uid $USERID $USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME/app
COPY app /home/$USERNAME/app
ENTRYPOINT ["python3", "predict.py"]
