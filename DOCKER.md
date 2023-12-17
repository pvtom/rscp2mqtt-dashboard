## Docker

A Docker image is available at https://hub.docker.com/r/pvtom/rscp2mqtt-dashboard

### Start the docker container

```
sudo docker run --rm -e MQTT_BROKER=localhost -e MQTT_PORT=1883 -p:1880:1880 pvtom/rscp2mqtt-dashboard:latest
```

Please adjust the MQTT broker and the port. Parameters can be set with the -e argument.

### Configuration

These parameters are available to configure MQTT settings:

- MQTT_BROKER
- MQTT_PORT
- MQTT_CLIENT_ID
- MQTT_USER
- MQTT_PASSWORD
- TOPIC_PREFIX

Value ranges can be adjusted with the following parameters:

- MAX_SOLAR_POWER
- MAX_HOME_POWER
- MAX_GRID_POWER
- MAX_BATTERY_POWER
- MAX_STRING_POWER
- MAX_PHASE_POWER
- MAX_BATTERY_RESERVE
