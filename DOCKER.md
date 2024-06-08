## Docker

A Docker image is available at https://hub.docker.com/r/pvtom/rscp2mqtt-dashboard

### Start the docker container

```
sudo docker run --rm -e MQTT_BROKER=localhost -e MQTT_PORT=1883 -p:1880:1880 pvtom/rscp2mqtt-dashboard:latest
```

or with TLS connection to the MQTT broker

```
sudo docker run --rm -e MQTT_USETLS=true -e MQTT_TLS_CERT=client.crt -e MQTT_TLS_KEY=client.key -e MQTT_TLS_CA=ca.crt -e MQTT_BROKER=192.168.178.123 -e MQTT_PORT=1883 -e verbose=1 -p:1890:1880 -v /path_to_certificates/tls:/tls pvtom/rscp2mqtt-dashboard:latest 
```

Please adjust the MQTT broker and the port. Parameters can be set with the -e argument.

### Configuration

These MQTT parameters are available:

- MQTT_BROKER
- MQTT_PORT
- MQTT_CLIENT_ID
- MQTT_USER
- MQTT_PASSWORD
- TOPIC_PREFIX

and for TLS (matching to the call above):

- MQTT_USETLS=true
- MQTT_TLS_CERT=client.crt
- MQTT_TLS_KEY=client.key
- MQTT_TLS_CA=ca.cr
- MQTT_TLS_CERTNAME
- MQTT_TLS_KEYNAME
- MQTT_TLS_CANAME
- MQTT_TLS_SERVERNAME
- MQTT_TLS_VERIFYSERVERCERT=false
- MQTT_TLS_ALPNPROTOCOL

Value ranges can be adjusted with the following parameters:

- MAX_SOLAR_POWER
- MAX_HOME_POWER
- MAX_GRID_POWER
- MAX_BATTERY_POWER
- MAX_STRING_POWER
- MAX_PHASE_POWER
- MAX_BATTERY_RESERVE

Verbose mode
- verbose=1
