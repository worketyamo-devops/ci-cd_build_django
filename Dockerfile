# Base image
FROM ubuntu:20.04

# Set environment to non-interactive for apt commands
ENV DEBIAN_FRONTEND=noninteractive

# Update system and install Python3 and pip
RUN apt update && apt upgrade -y && \
    apt install -y python3 python3-pip && \
    pip3 install --no-cache-dir django

# Copy application source code into the container
COPY myapp /myapp

# Set the working directory
WORKDIR /myapp

# Expose the port Django runs on
EXPOSE 8000

# Donner les permissions d'exécution
RUN chmod +x ./entrypoint.sh

# Utiliser le script comme point d'entrée
ENTRYPOINT ["./entrypoint.sh"]

# Command to start the Django server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
