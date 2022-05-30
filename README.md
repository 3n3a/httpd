<p align="center">
    <img src=".github/assets/logo.png" alt="apache4markdown logo" height="300px"/>
</p>

# Apache4Markdown

Utilises the Apache Webserver as a Markdown-Rendering-Server. It achieves this by passing the markdown into pandoc and returning the outputted HTML to the Browser.

## Quickstart

**Prerequisites**:

* Docker
* Docker-Compose
* Linux / MacOs / WSL2

**Getting Started**:

1. Clone this repository

    ```
    git clone https://github.com/3n3a/httpd
    ```

2. Switch to the `examples` directory

    ```
    cd httpd/examples
    ```

3. Start Apache4Markdown with DockerCompose

    ```
    docker-compose up -d
    ```

4. Your Apache4Markdown Webserver is now serving Markdown files from `examples/config/html`, at [http://localhost:8080](http://localhost:8080) 🚀

## Build Information

| Name | Status |
| --- | --- |
| Latest | [![Apache4Markdown](https://github.com/3n3a/httpd/actions/workflows/cd.yml/badge.svg?branch=master)](https://github.com/3n3a/httpd/actions/workflows/cd.yml) |
| Version 1.0.0 | [![Build and Push Docker Image](https://github.com/3n3a/httpd/actions/workflows/cd.yml/badge.svg?branch=v1.0.0)](https://github.com/3n3a/httpd/actions/workflows/cd.yml) |