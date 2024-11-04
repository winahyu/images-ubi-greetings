FROM registry.ocp4.example.com:8443/ubi9/nodejs-18-minimal:1-51

##or below, == select one

FROM default-route-openshift-image-registry.apps.ocp4.example.com/openshift/nodejs

ENV PORT=8080
EXPOSE ${PORT}

ADD . $HOME

RUN npm ci --omit=dev && rm -rf .npm

USER root
RUN chgrp -R 0 /var/cache && \
    chmod -R g=u /var/cache
USER 1001

CMD npm start
