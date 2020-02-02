#!/bin/bash

#if [ $# -eq 0 ]
#	then
#		echo 'Needs to supply argument'
#		echo '  $1 = <arg>'
#		exit 1
#fi

consul exec -node=raspberrypi python /home/pi/raspberry_pi_consul/scripts_client/bme280_sample.py 
