#!/usr/bin/env bash

configpath=archinstall-configs
config=$configpath/user_configuration.json
creds=$configpath/user_credentials.json
disklayout=$configpath/user_disk_layout.json

archinstall --config $config --creds $creds --disk_layouts $disklayout