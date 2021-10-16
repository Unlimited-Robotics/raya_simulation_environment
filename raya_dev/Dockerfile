FROM continuumio/miniconda3:4.10.3-alpine

WORKDIR /root

# Install packages
RUN apk add --no-cache nano vim mesa-gl glib py3-qt5

# Create conda environment with the dependencies
RUN pip install --no-cache-dir raya==0.7.0rc1 && \
    pip install --no-cache-dir rayasdk

RUN wget https://update.code.visualstudio.com/latest/server-linux-x64/stable -O vscode-server-linux-x64.tar.gz && \
    mkdir -p /root/.vscode-server/bin/latest && \
    tar zxvf vscode-server-linux-x64.tar.gz -C /root/.vscode-server/bin/latest/ --strip 1 && \
    touch /root/.vscode-server/bin/latest/0 && \
    rm -f vscode-server-linux-x64.tar.gz

RUN echo "export PS1='raya@simulator:\w\$ '" >> .bashrc && \
    touch foo.txt

CMD ["tail", "-F", "foo.txt"]
