FROM node:6.11.1
COPY . /project
WORKDIR /project
RUN cd /project/kibana ; npm install ; cd /project
ENTRYPOINT /bin/bash
