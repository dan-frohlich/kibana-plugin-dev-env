FROM danfrohlich/docker-node:6.10.2
COPY . /project
WORKDIR /project
RUN cd /project/kibana ; npm install ; cd /project
ENTRYPOINT /bin/bash
