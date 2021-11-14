#!/bin/bash

hub="docker.io"
repo="$hub/serialt"



if [ -f sync.yaml ]; then
   echo "[Start] sync......."
   
    sudo skopeo login -u ${HUB_USERNAME} -p ${HUB_PASSWORD} ${hub} \
    && sudo skopeo --insecure-policy sync --src yaml --dest docker sync.yaml ${repo} \
    && sudo skopeo --insecure-policy sync --src yaml --dest docker custom_sync.yaml ${repo}



   echo "[End] done."
   
else
    echo "[Error]not found sync.yaml!"
fi
