FROM mrlesmithjr/ubuntu-ansible:14.04

MAINTAINER Larry Smith Jr. <mrlesmithjr@gmail.com>

# Define Plex Version
ENV PLEX_VERSION="1.5.0.3501-3b8374a5c"

# Copy Ansible Related Files
COPY config/ansible/ /

# Run Ansible playbook
RUN ansible-playbook -i "localhost," -c local /playbook.yml \
    --extra-vars "plex_version=$PLEX_VERSION" && \
    apt-get -y clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Setup volumes for exposing to your host
VOLUME [ "/var/lib/plexmediaserver","/movies","/music","/pictures","/tv_shows","/videos"]

#Mappings and ports
EXPOSE 32400 32400/udp 32469 32469/udp 5353/udp 1900/udp

# Copy Startup Script
COPY start.sh /start.sh
RUN chmod +x /start.sh

USER plex

CMD ["/start.sh"]
