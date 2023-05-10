# Docker Postfix

![Test workflow](https://github.com/petk/docker-postfix/actions/workflows/test.yaml/badge.svg)
[![Docker Automated build](https://img.shields.io/docker/automated/petk/postfix.svg)](https://hub.docker.com/r/petk/postfix/) [![MIT License](https://img.shields.io/github/license/petk/docker-postfix.svg "MIT License")](https://github.com/petk/docker-postfix/blob/master/LICENSE)

Docker Image with Postfix Mail Server

## Features

* Alpine base image for small Docker image size
* Postfix mail server

## Tags

* `petk/postfix:latest` ([Dockerfile](https://github.com/petk/docker-postfix/blob/master/Dockerfile))

## Quick Usage

Create a `docker-compose.yml` for your setup:

```yaml
version: '3.2'

services:
  postfix:
    image: petk/postfix
    container_name: postfix
    restart: always
    ports:
      - 25:25
    networks:
      - your-network
    environment:
      - MYHOSTNAME=my.hostname.tld
      - MYDOMAIN=mydomain.tld
```

## License and Contributing

[Contributions](https://github.com/petk/docker-postfix/blob/master/CONTRIBUTING.md) are most welcome. This repository is released under the [MIT license](https://github.com/petk/docker-postfix/blob/master/LICENSE).
