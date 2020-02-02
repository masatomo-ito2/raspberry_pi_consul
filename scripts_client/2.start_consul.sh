#!/bin/bash

CONSUL_SERVER=192.168.0.150
consul agent -join ${CONSUL_SERVER} -data-dir ~/data_dir -config-file ~/config.json

