#!/bin/bash

echo "Configuration"

if [ $# -ne 1 ]
then
    echo "flow is missing, exit"
    exit
else
    echo "flow:" $1
fi

sed -i "s/DASHBOARD_VERSION/v1.0/g" $1

if [ -z "$MQTT_BROKER" ]
then
    echo "MQTT_BROKER: >localhost<"
    sed -i "s/MQTT_BROKER/localhost/g" $1
else 
    echo "MQTT_BROKER: >${MQTT_BROKER}<"
    sed -i "s/MQTT_BROKER/${MQTT_BROKER}/g" $1
fi

if [ -z "$MQTT_PORT" ]
then
    echo "MQTT_PORT: >1883<"
    sed -i "s/MQTT_PORT/1883/g" $1
else
    echo "MQTT_PORT: >${MQTT_PORT}<"
    sed -i "s/MQTT_PORT/${MQTT_PORT}/g" $1
fi

if [ -z "$MQTT_CLIENT_ID" ]
then
    echo "MQTT_CLIENT_ID: ><"
    sed -i "s/MQTT_CLIENT_ID//g" $1
else
    echo "MQTT_CLIENT_ID: >${MQTT_CLIENT_ID}<"
    sed -i "s/MQTT_CLIENT_ID/${MQTT_CLIENT_ID}/g" $1
fi

if [ -z "$MQTT_USETLS" ]
then
    echo "MQTT_USETLS: >false<"
    sed -i "s/MQTT_USETLS/false/g" $1
else
    echo "MQTT_USETLS: >${MQTT_USETLS}<"
    sed -i "s/MQTT_USETLS/${MQTT_USETLS}/g" $1
fi

if [ -z "$MQTT_USER" ] || [ -z "$MQTT_PASSWORD" ]
then
    sed -i "s/MQTT_CREDENTIALS//g" $1
else
    echo "MQTT_USER: >${MQTT_USER}<"
    echo "MQTT_PASSWORD: >${MQTT_PASSWORD}<"
    CREDENTIALS=",\"credentials\": {\"user\": \"MQTT_USER\", \"password\": \"MQTT_PASSWORD\"}"
    sed -i "s/MQTT_CREDENTIALS/${CREDENTIALS}/g" $1
    sed -i "s/MQTT_USER/${MQTT_USER}/g" $1
    sed -i "s/MQTT_PASSWORD/${MQTT_PASSWORD}/g" $1
fi

if [ -z "$TOPIC_PREFIX" ]
then
    echo "TOPIC_PREFIX: >e3dc<"
    sed -i "s/TOPIC_PREFIX/e3dc/g" $1
else
    echo "TOPIC_PREFIX: >${TOPIC_PREFIX}<"
    sed -i "s/TOPIC_PREFIX/${TOPIC_PREFIX}/g" $1
fi

if [ -z "$MAX_SOLAR_POWER" ]
then
    echo "MAX_SOLAR_POWER: >15000< (default)"
    sed -i "s/MAX_SOLAR_POWER/15000/g" $1
else
    echo "MAX_SOLAR_POWER: >${MAX_SOLAR_POWER}<"
    sed -i "s/MAX_SOLAR_POWER/${MAX_SOLAR_POWER}/g" $1
fi

if [ -z "$MAX_HOME_POWER" ]
then
    echo "MAX_HOME_POWER: >15000< (default)"
    sed -i "s/MAX_HOME_POWER/15000/g" $1
else
    echo "MAX_HOME_POWER: >${MAX_HOME_POWER}<"
    sed -i "s/MAX_HOME_POWER/${MAX_HOME_POWER}/g" $1
fi

if [ -z "$MAX_GRID_POWER" ]
then
    echo "MAX_GRID_POWER: >15000< (default)"
    sed -i "s/MAX_GRID_POWER/15000/g" $1
else
    echo "MAX_GRID_POWER: >${MAX_GRID_POWER}<"
    sed -i "s/MAX_GRID_POWER/${MAX_GRID_POWER}/g" $1
fi

if [ -z "$MAX_BATTERY_POWER" ]
then
    echo "MAX_BATTERY_POWER: >4500< (default)"
    sed -i "s/MAX_BATTERY_POWER/4500/g" $1
else
    echo "MAX_BATTERY_POWER: >${MAX_BATTERY_POWER}<"
    sed -i "s/MAX_BATTERY_POWER/${MAX_BATTERY_POWER}/g" $1
fi

if [ -z "$MAX_STRING_POWER" ]
then
    echo "MAX_STRING_POWER: >7500< (default)"
    sed -i "s/MAX_STRING_POWER/7500/g" $1
else
    echo "MAX_STRING_POWER: >${MAX_STRING_POWER}<"
    sed -i "s/MAX_STRING_POWER/${MAX_STRING_POWER}/g" $1
fi

if [ -z "$MAX_PHASE_POWER" ]
then
    echo "MAX_PHASE_POWER: >5000< (default)"
    sed -i "s/MAX_PHASE_POWER/5000/g" $1
else
    echo "MAX_PHASE_POWER: >${MAX_PHASE_POWER}<"
    sed -i "s/MAX_PHASE_POWER/${MAX_PHASE_POWER}/g" $1
fi

if [ -z "$MAX_BATTERY_RESERVE" ]
then
    echo "MAX_BATTERY_RESERVE: >5000< (default)"
    sed -i "s/MAX_BATTERY_RESERVE/5000/g" $1
else
    echo "MAX_BATTERY_RESERVE: >${MAX_BATTERY_RESERVE}<"
    sed -i "s/MAX_BATTERY_RESERVE/${MAX_BATTERY_RESERVE}/g" $1
fi
