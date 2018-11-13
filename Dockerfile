FROM node:8.11.4
COPY . /project
WORKDIR /project
RUN cd /project/kibana ; npm install ; cd /project
ENTRYPOINT /bin/bash
