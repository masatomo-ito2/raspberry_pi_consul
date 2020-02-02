#!/bin/bash

consul agent -server -bootstrap -ui=true -bootstrap-expect 1 -bind '{{ GetInterfaceIP "en0" }}' -data-dir ./data-dir 
