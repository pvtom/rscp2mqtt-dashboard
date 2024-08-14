FROM nodered/node-red

RUN rm -rf package-lock.json
RUN npm install --verbose node-red-contrib-aggregator node-red-dashboard

COPY prepare.sh .
COPY settings.js /data/settings.js
COPY flows.json.template /data/flows.json

RUN sed -i '/#!\/bin\/bash/a source prepare.sh /data/flows.json' entrypoint.sh
