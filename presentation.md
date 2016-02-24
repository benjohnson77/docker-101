## Docker
## Converting to Containers?
---
## Hi My Name is Ben

I like DevOps
I have 3 boys, an Awesome Wife and a cat.
We love Soccer and Jesus!  



---

## Set Up Your Local Machine

```bash
	brew update
	brew install docker docker-compose docker-swarm
	brew install docker-machine
```
	For windows you can install these programs with the docker toolbox.

[https://www.docker.com/docker-toolbox](https://www.docker.com/docker-toolbox)

---
## Docker Machine

_**Docker Machine**_ is used to manage docker hosts either locally or remotely.

_**Docker Compose**_ is used to describe a docker .

---

### Hello World!

``` bash
	➜  docker-demo git:(legalinc) ✗ docker run hello-world

	Unable to find image 'hello-world:latest' locally
	latest: Pulling from library/hello-world
	b901d36b6f2f: Pull complete
	0a6ba66e537a: Pull complete
	Digest: sha256:8be990ef2aeb16dbcb9271ddfe2610fa6658d13f6dfb8bc72074cc1ca36966a7
	Status: Downloaded newer image for hello-world:latest

	Hello from Docker.
	This message shows that your installation appears to be working correctly.

	To generate this message, Docker took the following steps:
	 1. The Docker client contacted the Docker daemon.
	 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
	 3. The Docker daemon created a new container from that image which runs the
	    executable that produces the output you are currently reading.
	 4. The Docker daemon streamed that output to the Docker client, which sent it
	    to your terminal.

	To try something more ambitious, you can run an Ubuntu container with:
	 $ docker run -it ubuntu bash

	Share images, automate workflows, and more with a free Docker Hub account:
	 https://hub.docker.com

	For more examples and ideas, visit:
	 https://docs.docker.com/userguide/
```
---
### The Essence
```
docker-machine restart dochost
docker-machine env
eval (docker-machine env dochost)
docker-machine regenerate-certs dochost

docker-compose build
docker-compose up -d

docker-compose pull
docker-compose run
```
---
### Building with Roles

	├── docker-compose.yml
	├── roles
	│   ├── mysql
	│   │   ├── Dockerfile
	│   │   ├── database.sql
	│   │   └── start-database.sh
	│   ├── nginx
	│   │   ├── Dockerfile
	│   │   ├── docker-compose.yml
	│   │   ├── index.html
	│   │   ├── sites-enabled
	│   │   │   └── local.conf
	│   │   ├── ssl
	│   │   │   ├── server.crt
	│   │   │   └── server.key
	│   │   └── supervisord.conf
	│   └── php-fpm
	│       ├── Dockerfile
	│       ├── docker-php-ext-configure
	│       ├── docker-php-ext-enable
	│       ├── docker-php-ext-install
	│       └── php-fpm.conf

---
### Using Server Spec

You can call this Compliance :)

Do you ? ... lsof -i :3000
Do you ? ps -ef | grep 443

Why Guess when you can know?

---
