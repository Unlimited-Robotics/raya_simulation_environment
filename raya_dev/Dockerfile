FROM continuumio/miniconda3:4.10.3-alpine

# Install packages
RUN apk add --no-cache nano

# Create conda environment with the dependencies
RUN pip install rayasdk

WORKDIR /root
RUN wget https://update.code.visualstudio.com/latest/server-linux-x64/stable -O vscode-server-linux-x64.tar.gz
RUN mkdir -p /root/.vscode-server/bin/latest
RUN tar zxvf vscode-server-linux-x64.tar.gz -C /root/.vscode-server/bin/latest/ --strip 1
RUN touch /root/.vscode-server/bin/latest/0
RUN rm -f vscode-server-linux-x64.tar.gz
RUN echo "export PS1='raya@simulator$ '" >> .bashrc

WORKDIR /root

# Wait for 5 seconds before running the APi to give time to another container to start
CMD ["tail", "-F", "anything"]
