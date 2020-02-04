#!/bin/bash

consul watch -type=key -key=pi/temp "jq -r .Value | base64 -D && echo" 
