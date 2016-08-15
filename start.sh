#!/bin/bash

# Preferences
PLEX_CONFIG_DIR="/var/lib/plexmediaserver"
PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="${PLEX_CONFIG_DIR}/Library/Application Support"
PLEX_PID="${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}/Plex Media Server/plexmediaserver.pid"

# Remove previous pid if it exists
rm "${PLEX_PID}"

/usr/sbin/start_pms
