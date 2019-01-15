#!/bin/bash

IS_GCE=$(wget -q -O - --header Metadata-Flavor:Google metadata/computeMetadata/v1/instance/machine-type)
if [ ! $IS_GCE ]; then
    echo "Not a gcloud instance."
    exit 1
    else
	INSTANCE_IP=$(curl -s "http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip" -H "Metadata-Flavor: Google")
	echo "Instance External IP: $INSTANCE_IP"
	export INSTANCE_IP=$INSTANCE_IP
fi
