# docker-teradata-pyodbc

This repo is to build a Docker Teradata Client on Ubuntu with Python2.7 and python-pip installed.

## Before building the environment

- Download UnixODBC from [UnixODBC](http://www.unixodbc.org/download.html)
- Register and download Teradat Driver from [Teradata ODBC Driver	for Linux](http://downloads.teradata.com/download/connectivity/odbc-driver/linux)
- Copy both .tar.gz files to docker-teradata-ubuntu/

## Build
`docker build -t python-teradata-client --force-rm=true --no-cache=true .`

## Run
`docker run -ti python-teradata-client`
