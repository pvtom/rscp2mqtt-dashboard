# Dashboard for displaying the values of an E3/DC S10 home power station 

Based on Node-RED this dashboard was realized. It displays the data of the house power plant that the tool RSCP2MQTT publishes via the MQTT broker.

![Dashboard](dashboard.png)

## Prerequisites

- a running rscp2mqtt instance (https://github.com/pvtom/rscp2mqtt)
- an installation of Node-RED (https://nodered.org)
  including the modules "node-red-dashboard" and "node-red-contrib-aggregator"

## Installation

Please follow the installation steps on the Node-RED homepage.

Import the dashboard.flow

Adjust the settings in the mqtt in and out nodes.

Deploy the changes and press the inject button of the "init" node to load the data.
The data in the charts will be populated over the next 24 hours.

Dashboard URL: http://<your_node_red_host>:1880/ui/
