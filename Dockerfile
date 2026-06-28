FROM nodered/node-red:latest

RUN npm install node-red-contrib-aggregator node-red-dashboard

COPY prepare.sh .
COPY settings.js /data/settings.js
COPY flows_cred.json.unused /data/flows_cred.json.unused
COPY flows.json.template /data/flows.json.template
COPY flows.json.template /data/flows.json

RUN sed -i '/#!\/bin\/bash/a source prepare.sh /data/flows.json /data/flows_cred.json' entrypoint.sh
