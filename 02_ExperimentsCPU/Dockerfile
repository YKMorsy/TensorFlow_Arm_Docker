FROM python:3.8.8-slim-buster

# Avoid some terminal-related warnings by switching to noninteractive mode
ARG DEBIAN_FRONTEND=noninteractive

# Install libraries required by OpenCV2
RUN apt-get update \
&& apt-get -y install --no-install-recommends ffmpeg libsm6 libxext6 \
&& apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Create new non-root user
ARG USERNAME=mluser
ARG USERID=1000
RUN useradd --system --create-home --shell /bin/bash --uid $USERID $USERNAME

# Configure Python environment
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt \
&& rm /tmp/requirements.txt
RUN pip3 install --no-cache-dir https://github.com/bitsy-ai/tensorflow-arm-bin/releases/download/v2.4.0/tensorflow-2.4.0-cp37-none-linux_aarch64.whl


# Switch user to the created non-root one and start jupyter notebook (by default)
USER $USERNAME
WORKDIR /home/$USERNAME/app

EXPOSE 9000

CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--port", "9000"]
