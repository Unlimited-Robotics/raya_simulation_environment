FROM continuumio/miniconda3:4.10.3-alpine

WORKDIR /root

RUN apk add --no-cache nano vim mesa-gl glib py3-qt5 \
    && pip install --no-cache-dir raya==0.6.4 \
    && pip install --no-cache-dir rayasdk \
    && wget https://update.code.visualstudio.com/latest/server-linux-x64/stable -O vscode-server-linux-x64.tar.gz \
    && mkdir -p /root/.vscode-server/bin/latest \
    && tar zxvf vscode-server-linux-x64.tar.gz -C /root/.vscode-server/bin/latest/ --strip 1 \
    && touch /root/.vscode-server/bin/latest/0 \
    && rm -f vscode-server-linux-x64.tar.gz \
    && echo "export PS1='raya@simulator:\w\$ '" >> .bashrc \
    && touch foo.txt

CMD ["tail", "-F", "foo.txt"]
