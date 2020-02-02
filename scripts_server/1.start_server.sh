#!/bin/bash

#if [ $# -eq 0 ]
#	then
#		echo 'Needs to supply argument'
#		echo '  $1 = <arg>'
#		exit 1
#fi

consul agent -server -bootstrap -ui=true -bootstrap-expect 1 -bind '{{ GetInterfaceIP "en0" }}' -data-dir ./data-dir 
