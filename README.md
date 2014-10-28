netcat-proxy-docker
===================

Provides a dead simple netcat-based proxy suitable for proxying tcp ports of existing docker containers.

This is useful if you want to expose ports of docker containers that are already running where you do not
have the ability to run them with different port `-p` options, but you can launch new docker containers.

Usage
=====
To use the image provide the following environment variables (via the `-e` flag to `docker run`):

`TARGET=<IP address or host name of target docker instance to proxy>`
`PORT=<TCP port on target to proxy>'

Netcat will proxy requests received on its local port $PORT to the target $TARGET and response back.
So to use it we pass the `-p <docker host port>:$PORT` flag to `docker run`.

See also [docker-proxy.sh].

Example
=======
For example, to connect to a Java debugger running on 172.17.0.10:5005 you could run:

```bash
docker run -p 5005:5005 -e "TARGET=172.17.0.10" -e "PORT=5005" silasdavis/netcat-proxy-docker
```
