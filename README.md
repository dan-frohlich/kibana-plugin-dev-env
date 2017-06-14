# kibana-plugin-dev-env
a dev env for kibana plugins

## Prereqs
docker
docker-compose is optional.

## Usage
1. make a custom entry script such as saved as ./dev-entry.sh
```bash
#!/bin/bash
npm start -- --elasticsearch.url "${ELASTICSEARCH_URL}" --no-ssl --server.host "${SERVER_NAME}"
```

### docker-compose
2. edit docker-compose.yml in your plugin folder.
```yaml
version: '2'
services:
  kibana:
    container_name: kibana-plugin-dev
    image: docker-remote.registry.kroger.com/danfrohlich/kibana-plugin-dev-env:v5.4.1
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

### docker
2. 
```bash
docker run -d \
  --name kibana-plugin-dev \
  --entrypoint /project/plugin_folder/dev-entry.sh \
  -v .:/project/plugin_folder \
  -p 5601:5601 \
  -e "ELASTICSEARCH_URL=http://[your-es-host-here]:9200" \
  -w /project/plugin_folder \
  -e "SERVER_NAME=0.0.0.0" \
  docker-remote.registry.kroger.com/danfrohlich/kibana-plugin-dev-env:v5.4.1
```
