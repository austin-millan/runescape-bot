#!/bin/bash

IS_GCE=$(wget -q -O - --header Metadata-Flavor:Google metadata/computeMetadata/v1/instance/machine-type)
if [ ! $IS_GCE ]; then
    echo "Not a gcloud instance."
    exit 1
    else
	echo "Setting environment variables."
	export RUNEMATE_USERNAME=$(curl -s "http://metadata.google.internal/computeMetadata/v1/instance/attributes/runemate_username" -H "Metadata-Flavor: Google")
	export RUNEMATE_PASSWORD=$(curl -s "http://metadata.google.internal/computeMetadata/v1/instance/attributes/runemate_password" -H "Metadata-Flavor: Google")
	export RS_CREDENTIALS=$(curl -s "http://metadata.google.internal/computeMetadata/v1/instance/attributes/all_rs_credentials" -H "Metadata-Flavor: Google")
	if [ -e accounts.csv ]; then
	    echo "Exporting RS credentials to file."
	    echo "$RS_CREDENTIALS"  > accounts_gcloud_meta.csv
	    else
		echo "$RS_CREDENTIALS"  > accounts.csv
	    fi
fi
