shout:
  image: arbourd/shout
  log_driver: {{PROJECT_DOCKER_LOG_DRIVER}}
  volumes:
    - {{PROJECT_NAMESPACE}}_shout_config:/shout
  environment:
    - VIRTUAL_HOST={{PROJECT_NGINX_PROXY_VIRTUAL_HOSTS}}
    - VIRTUAL_PORT=9000
    - PRIVATE=true
{{#PROJECT_LETSENCRYPT}}
    - LETSENCRYPT_HOST={{PROJECT_NGINX_PROXY_VIRTUAL_HOSTS}}
    - LETSENCRYPT_EMAIL={{PROJECT_LETSENCRYPT_EMAIL}}
{{/PROJECT_LETSENCRYPT}}

# vi: set tabstop=2 expandtab syntax=yaml:
