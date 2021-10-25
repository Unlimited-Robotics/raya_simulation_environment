FROM continuumio/miniconda3:4.10.3-alpine

# Install system dependencies
RUN apk add --no-cache musl-dev git gcc mesa-gl glib

# Create Gary's ID
RUN mkdir /etc/gary
RUN echo -e "title=\"Configuration file for Gary\"\n[general]\n\tid=\"Gary-$(tr -dc a-z </dev/urandom | head -c 10)\"\n\tname=\"Gary in Docker\"" \
    > /etc/gary/config.toml

# Create a directory for the project
RUN mkdir /app
WORKDIR /app/

# Copy code to the project directory
COPY ./ ./

# Create conda environment with the dependencies
RUN conda env create --file environment-dev.yaml

RUN adduser -s /bin/bash -h /home/raya/ -G root -D raya

# Wait for 5 seconds before running the APi to give time to another container to start
CMD ["bash", "-c", "sleep 5 && source activate ggs && python main.py"]
