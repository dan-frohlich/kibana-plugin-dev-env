# kibana-plugin-dev-env
a dev env for kibana plugins

## Prereqs
* docker
* docker-compose is *optional*.

## Usage
1. make a custom entry script such as saved as ./dev-entry.sh
```bash
#!/bin/bash
npm install
npm run build
npm start -- --elasticsearch.url "${ELASTICSEARCH_URL}" --no-ssl --server.host "${SERVER_NAME}"
```

### if using docker-compose
2. edit docker-compose.yml in your plugin folder.
```yaml
version: '2'
services:
  kibana:
    container_name: kibana-plugin-dev
    image: danfrohlich/kibana-plugin-dev-env:v6.4.3
    entrypoint: /project/plugin_folder/dev-entry.sh
    environment:
      ELASTICSEARCH_URL: http://[your-es-host-here]:9200
      SERVER_NAME: 0.0.0.0
    volumes:
      - .:/project/plugin_folder
    ports:
      - "5601:5601"
    working_dir: /project/plugin_folder
```
3. docker-compose up

### docker (not using docker-compose)
2. run the container.
```bash
docker run -d \
  --name kibana-plugin-dev \
  --entrypoint /project/plugin_folder/dev-entry.sh \
  -v .:/project/plugin_folder \
  -p 5601:5601 \
  -e "ELASTICSEARCH_URL=http://[your-es-host-here]:9200" \
  -w /project/plugin_folder \
  -e "SERVER_NAME=0.0.0.0" \
  danfrohlich/kibana-plugin-dev-env:v6.4.3
```

### to run tets cases...
1. enter running container
```bash
docker exec -it kibana-plugin-dev bash
```
2. execute helper testing tasks
```bash
plugin-helpers test:server
```
```bash
plugin-helpers test:browser
```

### RELEASE NOTES
- updated to kibana v6.4.3
