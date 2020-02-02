# Raspberry Pi with Consul

Demo to install consul on Raspberry Pi. This demo will:
- Create consul cluster with Raspberry PI.
- Read sensor data (Temprature/Pressure/Humidity) and write them to Consul K/V

## Hardware used in this demo

- Raspberry PI
  - [Raspberry PI 3 model B](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/)
- Sensor
  - [BME280](https://www.bosch-sensortec.com/products/environmental-sensors/humidity-sensors-bme280/)

## Hardware set up

- Raspberry PI
  - OS install
    - https://www.raspberrypi.org/downloads/raspbian/
  - Install necessary softwares

- Sensor
  - [How to set up sensor](https://www.deviceplus.com/how-tos/raspberrypi-guide/reading-temperature-humidity-and-pressure-with-ae-bme280-and-raspberry-pi/)

## Software set up
- Raspberry PI
  - Clone this repository
    - `git clone https://github.com/masatomo-ito2/raspberry_pi_consul.git`
  - Run [1.install_software.sh](./scripts_client/1.install_software.sh)
- Consul server
  - Clone this repository
    - `git clone https://github.com/masatomo-ito2/raspberry_pi_consul.git`


## Set up Consul cluster
1. Start consul server **on host machine**
  - Run [1.start_server.sh](./scripts_server/1.start_server.sh)
2. Start consul client **on Raspberry PI**
  - Run [2.start_consul.sh](./scripts_client/2.start_consul.sh)

## Read the sensor data

- You can read the raw sensor data with [I2C communication protocol](https://en.wikipedia.org/wiki/I%C2%B2C):
  - `sudo i2cdump -y 1 0x76`
- Python script to convert raw sensor data to human readable and write to Consul K/V.
  - [bme280_sample.py](./scripts_client/bme280_sample.py)
  - `python bme280_sample.py`
- Use `consul exec` to get/update data from host.
  - ```shell
consul exec -node=raspberrypi python /home/pi/raspberry_pi_consul/scripts_client/bme280_sample.py
```

## Future TODO
- [____] On Raspberry PI, set up systemd　to start consul automatically.
- [____] Set up datadog dashboard to monitor sensor data.
