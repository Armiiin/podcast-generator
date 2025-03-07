FROM ubuntu:latest

#Install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    python3-yaml \
    python3-venv  # Ensure virtual environments can be created

# Create virtual enviroment
RUN python3 -m venv /venv

#Upgrade pip inside the virtual enviroment
RUN /venv/bin/pip install --upgrade pip

#Install dependency
RUN /venv/bin/pip install pyyaml

#Copy application files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

#Set virtual enviroment as the default Python enviroment
ENV PATH="/venv/bin:$PATH"
ENTRYPOINT [ "/entrypoint.sh" ]
