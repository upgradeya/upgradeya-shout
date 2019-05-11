lounge:
  image: thelounge/thelounge
  log_driver: {{PROJECT_DOCKER_LOG_DRIVER}}
  volumes_from:
    - lounge_volumes
  ports:
    - "9000:9000"
  environment:
    - VIRTUAL_HOST={{PROJECT_NGINX_PROXY_VIRTUAL_HOSTS}}
    - VIRTUAL_PORT=9000
    - PRIVATE=true
    - THELOUNGE_HOME=/var/opt/thelounge
{{#PROJECT_LETSENCRYPT}}
    - LETSENCRYPT_HOST={{PROJECT_NGINX_PROXY_VIRTUAL_HOSTS}}
    - LETSENCRYPT_EMAIL={{PROJECT_LETSENCRYPT_EMAIL}}
{{/PROJECT_LETSENCRYPT}}
  command: thelounge start -c --port "9000"
{{#PRODUCTION}}
  restart: always
{{/PRODUCTION}}
lounge_volumes:
  image: busybox
  command: echo "Lounge files container. Doing nothing."
  volumes:
    - {{PROJECT_NAMESPACE}}_thelounge_config:/var/opt/thelounge
  labels:
    - "data_container=true"
  log_driver: {{PROJECT_DOCKER_LOG_DRIVER}}

# vi: set tabstop=2 expandtab syntax=yaml:
