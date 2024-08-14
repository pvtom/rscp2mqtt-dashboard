#!/bin/bash

echo "Configuration"

if [ $# -ne 1 ]
then
    echo "flow is missing, exit"
    exit
else
    echo "flow:" $1
fi

if [ -n "$WALLBOX" ] && $WALLBOX == "true"
then
    echo "WALLBOX=true"
    sed -i "s/WBTEXT//g" $1
    sed -i "s/CLEAR_VALUE/6/g" $1
    sed -i "s/WB_GAUGE_WIDTH/2/g" $1
    sed -i "s/WBVERSION/(Wallbox)/g" $1
else
    echo "WALLBOX=false"
    grep -v WBTEXT $1 > ${1}.tmp
    mv -f ${1}.tmp $1
    sed -i "s/CLEAR_VALUE/5/g" $1
    sed -i "s/WB_GAUGE_WIDTH/3/g" $1
    sed -i "s/WBVERSION//g" $1
fi

if [ -z "$WALLBOX_NAME" ]
then 
    echo "WALLBOX_NAME: >Wallbox< (default)"
    sed -i "s/WALLBOX_NAME/Wallbox/g" $1
else
    echo "WALLBOX_NAME: >${WALLBOX_NAME}<"
    sed -i "s|WALLBOX_NAME|${WALLBOX_NAME}|g" $1
fi

if [ -z "$WALLBOX_TOPIC" ]
then
    echo "WALLBOX_TOPIC: >TOPIC_PREFIX/wallbox/power/total<"
    sed -i "s|WALLBOX_TOPIC|TOPIC_PREFIX/wallbox/power/total|g" $1
    sed -i "s|SUBSCRIBE_TOPIC|TOPIC_PREFIX/#|g" $1
else
    echo "WALLBOX_TOPIC: >${WALLBOX_TOPIC}<"
    sed -i "s|WALLBOX_TOPIC|${WALLBOX_TOPIC}|g" $1
    sed -i "s|SUBSCRIBE_TOPIC|#|g" $1
fi

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
    sed -i "s|MQTT_CLIENT_ID|${MQTT_CLIENT_ID}|g" $1
fi

if [ -z "$MQTT_USETLS" ]
then
    echo "MQTT_USETLS: >false<"
    sed -i "s/MQTT_USETLS/false/g" $1
    sed -i "s/MQTT_TLS_OBJ//g" $1
    sed -i "s/DASHBOARD_VERSION/v2.0/g" $1
else
    echo "MQTT_USETLS: >true<"
    sed -i "s/MQTT_USETLS/true/g" $1
    if [ -z "$MQTT_EMPTY_TLS_OBJ" ]
    then
        sed -i "s/MQTT_TLS_OBJ/\"tls\": \"e609b2bcbc41aaaf\",/g" $1
    else
        sed -i "s/MQTT_TLS_OBJ/\"tls\": \"\",/g" $1
    fi
    sed -i "s/DASHBOARD_VERSION/v2.0(TLS)/g" $1
fi

if [ -z "$MQTT_TLS_CERTNAME" ]
then
    echo "MQTT_TLS_CERTNAME: ><"
    sed -i "s/MQTT_TLS_CERTNAME//g" $1
else
    echo "MQTT_TLS_CERTNAME: >${MQTT_TLS_CERTNAME}<"
    sed -i "s|MQTT_TLS_CERTNAME|${MQTT_TLS_CERTNAME}|g" $1
fi

if [ -z "$MQTT_TLS_KEYNAME" ]
then
    echo "MQTT_TLS_KEYNAME: ><"
    sed -i "s/MQTT_TLS_KEYNAME//g" $1
else
    echo "MQTT_TLS_KEYNAME: >${MQTT_TLS_KEYNAME}<"
    sed -i "s|MQTT_TLS_KEYNAME|${MQTT_TLS_KEYNAME}|g" $1
fi

if [ -z "$MQTT_TLS_CANAME" ]
then
    echo "MQTT_TLS_CANAME: ><"
    sed -i "s/MQTT_TLS_CANAME//g" $1
else
    echo "MQTT_TLS_CANAME: >${MQTT_TLS_CANAME}<"
    sed -i "s|MQTT_TLS_CANAME|${MQTT_TLS_CANAME}|g" $1
fi

if [ -z "$MQTT_TLS_CERT" ]
then
    echo "MQTT_TLS_CERT: ><"
    sed -i "s/MQTT_TLS_CERT//g" $1
else
    echo "MQTT_TLS_CERT: >${MQTT_TLS_CERT}<"
    sed -i "s|MQTT_TLS_CERT|${MQTT_TLS_CERT}|g" $1
fi

if [ -z "$MQTT_TLS_KEY" ]
then
    echo "MQTT_TLS_KEY: ><"
    sed -i "s/MQTT_TLS_KEY//g" $1
else 
    echo "MQTT_TLS_KEY: >${MQTT_TLS_KEY}<"
    sed -i "s|MQTT_TLS_KEY|${MQTT_TLS_KEY}|g" $1
fi

if [ -z "$MQTT_TLS_CA" ]
then
    echo "MQTT_TLS_CA: ><"
    sed -i "s/MQTT_TLS_CA//g" $1
else
    echo "MQTT_TLS_CA: >${MQTT_TLS_CA}<"
    sed -i "s|MQTT_TLS_CA|${MQTT_TLS_CA}|g" $1
fi

if [ -z "$MQTT_TLS_SERVERNAME" ]
then
    echo "MQTT_TLS_SERVERNAME: ><"
    sed -i "s/MQTT_TLS_SERVERNAME//g" $1
else
    echo "MQTT_TLS_SERVERNAME: >${MQTT_TLS_SERVERNAME}<"
    sed -i "s|MQTT_TLS_SERVERNAME|${MQTT_TLS_SERVERNAME}|g" $1
fi

if [ -z "$MQTT_TLS_VERIFYSERVERCERT" ]
then
    echo "MQTT_TLS_VERIFYSERVERCERT: >false<"
    sed -i "s/MQTT_TLS_VERIFYSERVERCERT/false/g" $1
else
    echo "MQTT_TLS_VERIFYSERVERCERT: >${MQTT_TLS_VERIFYSERVERCERT}<"
    sed -i "s|MQTT_TLS_VERIFYSERVERCERT|${MQTT_TLS_VERIFYSERVERCERT}|g" $1
fi

if [ -z "$MQTT_TLS_ALPNPROTOCOL" ]
then
    echo "MQTT_TLS_ALPNPROTOCOL: ><"
    sed -i "s/MQTT_TLS_ALPNPROTOCOL//g" $1
else
    echo "MQTT_TLS_ALPNPROTOCOL: >${MQTT_TLS_ALPNPROTOCOL}<"
    sed -i "s|MQTT_TLS_ALPNPROTOCOL|${MQTT_TLS_ALPNPROTOCOL}|g" $1
fi

if [ -z "$MQTT_USER" ] || [ -z "$MQTT_PASSWORD" ]
then
    sed -i "s/MQTT_CREDENTIALS//g" $1
else
    echo "MQTT_USER: >${MQTT_USER}<"
    echo "MQTT_PASSWORD: >${MQTT_PASSWORD}<"
    CREDENTIALS=",\"credentials\": {\"user\": \"MQTT_USER\", \"password\": \"MQTT_PASSWORD\"}"
    sed -i "s|MQTT_CREDENTIALS|${CREDENTIALS}|g" $1
    sed -i "s|MQTT_USER|${MQTT_USER}|g" $1
    sed -i "s|MQTT_PASSWORD|${MQTT_PASSWORD}|g" $1
fi

if [ -z "$TOPIC_PREFIX" ]
then
    echo "TOPIC_PREFIX: >e3dc<"
    sed -i "s/TOPIC_PREFIX/e3dc/g" $1
else
    echo "TOPIC_PREFIX: >${TOPIC_PREFIX}<"
    sed -i "s|TOPIC_PREFIX|${TOPIC_PREFIX}|g" $1
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

if [ -z "$MAX_WALLBOX_POWER" ]
then
    echo "MAX_WALLBOX_POWER: >11000< (default)"
    sed -i "s/MAX_WALLBOX_POWER/11000/g" $1
else
    echo "MAX_WALLBOX_POWER: >${MAX_WALLBOX_POWER}<"
    sed -i "s/MAX_WALLBOX_POWER/${MAX_WALLBOX_POWER}/g" $1
fi

if [ -z "$MAX_BATTERY_RESERVE" ]
then
    echo "MAX_BATTERY_RESERVE: >5000< (default)"
    sed -i "s/MAX_BATTERY_RESERVE/5000/g" $1
else
    echo "MAX_BATTERY_RESERVE: >${MAX_BATTERY_RESERVE}<"
    sed -i "s/MAX_BATTERY_RESERVE/${MAX_BATTERY_RESERVE}/g" $1
fi

if [ -z "$UI_ORDER_1_PHOTOVOLTAICS" ]
then
    echo "UI_ORDER_1_PHOTOVOLTAICS: >1< (default)"
    sed -i "s/UI_ORDER_1_PHOTOVOLTAICS/1/g" $1
else
    echo "UI_ORDER_1_PHOTOVOLTAICS: >${UI_ORDER_1_PHOTOVOLTAICS}<"
    sed -i "s/UI_ORDER_1_PHOTOVOLTAICS/${UI_ORDER_1_PHOTOVOLTAICS}/g" $1
fi

if [ -z "$UI_ORDER_2_POWER_DIAGRAM" ]
then
    echo "UI_ORDER_2_POWER_DIAGRAM: >2< (default)"
    sed -i "s/UI_ORDER_2_POWER_DIAGRAM/2/g" $1 
else
    echo "UI_ORDER_2_POWER_DIAGRAM: >${UI_ORDER_2_POWER_DIAGRAM}<"
    sed -i "s/UI_ORDER_2_POWER_DIAGRAM/${UI_ORDER_2_POWER_DIAGRAM}/g" $1
fi

if [ -z "$UI_ORDER_3_PM" ]
then
    echo "UI_ORDER_3_PM: >3< (default)"
    sed -i "s/UI_ORDER_3_PM/3/g" $1
else
    echo "UI_ORDER_3_PM: >${UI_ORDER_3_PM}<"
    sed -i "s/UI_ORDER_3_PM/${UI_ORDER_3_PM}/g" $1
fi

if [ -z "$UI_ORDER_4_PVI" ]
then
    echo "UI_ORDER_4_PVI: >4< (default)" 
    sed -i "s/UI_ORDER_4_PVI/4/g" $1
else
    echo "UI_ORDER_4_PVI: >${UI_ORDER_4_PVI}<"
    sed -i "s/UI_ORDER_4_PVI/${UI_ORDER_4_PVI}/g" $1
fi

if [ -z "$UI_ORDER_5_CHARTS" ]
then
    echo "UI_ORDER_5_CHARTS: >5< (default)"
    sed -i "s/UI_ORDER_5_CHARTS/5/g" $1
else
    echo "UI_ORDER_5_CHARTS: >${UI_ORDER_5_CHARTS}<"
    sed -i "s/UI_ORDER_5_CHARTS/${UI_ORDER_5_CHARTS}/g" $1
fi

if [ -z "$UI_ORDER_6_ANNUAL" ]
then
    echo "UI_ORDER_6_ANNUAL: >6< (default)"
    sed -i "s/UI_ORDER_6_ANNUAL/6/g" $1
else
    echo "UI_ORDER_6_ANNUAL: >${UI_ORDER_6_ANNUAL}<"
    sed -i "s/UI_ORDER_6_ANNUAL/${UI_ORDER_6_ANNUAL}/g" $1
fi

if [ -z "$UI_ORDER_7_SETTINGS" ]
then
    echo "UI_ORDER_7_SETTINGS: >7< (default)"
    sed -i "s/UI_ORDER_7_SETTINGS/7/g" $1
else
    echo "UI_ORDER_7_SETTINGS: >${UI_ORDER_7_SETTINGS}<"
    sed -i "s/UI_ORDER_7_SETTINGS/${UI_ORDER_7_SETTINGS}/g" $1
fi

if [ -z "$UI_ORDER_8_LIMITER" ]
then
    echo "UI_ORDER_8_LIMITER: >8< (default)"
    sed -i "s/UI_ORDER_8_LIMITER/8/g" $1
else
    echo "UI_ORDER_8_LIMITER: >${UI_ORDER_8_LIMITER}<"
    sed -i "s/UI_ORDER_8_LIMITER/${UI_ORDER_8_LIMITER}/g" $1
fi

if [ -z "$PASSTHRU" ]
then
    echo "PASSTHRU: >false< (default)"
    sed -i "s/PASSTHRU/false/g" $1
else
    echo "PASSTHRU: >${PASSTHRU}<"
    sed -i "s/PASSTHRU/${PASSTHRU}/g" $1
fi

if [ -n "$verbose" ]
then
    echo "Content of $1"
    cat $1
fi
