# Dashboard for an E3/DC Home Power Station
[![GitHub sourcecode](https://img.shields.io/badge/Source-GitHub-green)](https://github.com/pvtom/rscp2mqtt-dashboard/)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/pvtom/rscp2mqtt-dashboard)](https://github.com/pvtom/rscp2mqtt-dashboard/releases/latest)
[![GitHub last commit](https://img.shields.io/github/last-commit/pvtom/rscp2mqtt-dashboard)](https://github.com/pvtom/rscp2mqtt-dashboard/commits)
[![GitHub issues](https://img.shields.io/github/issues/pvtom/rscp2mqtt-dashboard)](https://github.com/pvtom/rscp2mqtt-dashboard/issues)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/pvtom/rscp2mqtt-dashboard)](https://github.com/pvtom/rscp2mqtt-dashboard/pulls)
[![GitHub](https://img.shields.io/github/license/pvtom/rscp2mqtt-dashboard)](https://github.com/pvtom/rscp2mqtt-dashboard/blob/main/LICENSE)

The dashboard visualizes data from a home power station by subscribing to MQTT topics published by [rscp2mqtt](https://github.com/pvtom/rscp2mqtt).

![Dashboard](dashboard.png)

## Docker

Instead of installing the package, you can simply use an existing [Docker image](DOCKER.md).

## Prerequisites

- a running rscp2mqtt instance (https://github.com/pvtom/rscp2mqtt), v3.8 or higher
- an existing MQTT broker (TLS is supported)
- an installation of Node-RED (https://nodered.org)
  including the modules "node-red-dashboard" and "node-red-contrib-aggregator" or
- a Docker environment on your system

## Installation of the package

Please follow the installation steps on the Node-RED homepage.

## Load the flow

Import the file dashboard_flow.json, adjust the broker settings in one of the mqtt nodes and deploy the changes

or

set the parameters as environment variables and start the prepare script (i.e. with bash):

```
export MQTT_BROKER="localhost"
export TOPIC_PREFIX="e3dc"

cp -a flows.json.template flows.json

./prepare.sh flows.json
```

afterwards import flows.json into NODE-RED.

These MQTT parameters are available:

- MQTT_BROKER
- MQTT_PORT
- MQTT_CLIENT_ID
- MQTT_USER
- MQTT_PASSWORD
- MQTT_USETLS
- MQTT_EMPTY_TLS_OBJ
- MQTT_TLS_CERT
- MQTT_TLS_KEY
- MQTT_TLS_CA
- MQTT_TLS_CERTNAME
- MQTT_TLS_KEYNAME
- MQTT_TLS_CANAME
- MQTT_TLS_SERVERNAME
- MQTT_TLS_VERIFYSERVERCERT
- MQTT_TLS_ALPNPROTOCOL
- TOPIC_PREFIX

Value ranges can be adjusted with the following parameters:

- MAX_SOLAR_POWER
- MAX_HOME_POWER
- MAX_GRID_POWER
- MAX_BATTERY_POWER
- MAX_STRING_POWER
- MAX_PHASE_POWER
- MAX_BATTERY_RESERVE
- MAX_WALLBOX_POWER

Wallbox

- WALLBOX (true/false)
- WALLBOX_NAME
- WALLBOX_TOPIC

Use these parameters (1 to 8) to set the order in which the UI elements are arranged:

- UI_ORDER_1_PHOTOVOLTAICS
- UI_ORDER_2_POWER_DIAGRAM
- UI_ORDER_3_PM
- UI_ORDER_4_PVI
- UI_ORDER_5_CHARTS
- UI_ORDER_6_ANNUAL
- UI_ORDER_7_SETTINGS
- UI_ORDER_8_LIMITER

## Access the dashboard

The dashboard will be accessible at http://<your_node_red_host>:1880/ui

The chart data is collected over the next 24 hours.
