# Setup

Install the Docker toolkit and the AWS CLI

```bash
bin/setup.sh

# brew update
# brew install awscli --HEAD
# brew install docker docker-compose docker-swarm
# brew cask install docker-machine
```

# Build a combined environment on Digital Ocean

This version of `data-eng-dockerfiles` can build a staging environment on either VirtualBox or Digital Ocean.

Future versions will use AWS.

```bash
export DIGITAL_OCEAN_TOKEN=blahblahblahblahblahblah
bin/build.sh
```

The VirtualBox version currently requires editing the `#create` method in `bin/build.sh` and is not for the faint of heart.

# Run the tests

```bash
bin/run_combined_tests
```

# Docker Workflow

Using docker-compose your able to simplify the command line arguments that would be required with docker commands.

cd into the role that you want to build. Using the proxy server as the example.

`docker-compose build proxy`

`docker-compose run -d`

You can make changes to docker files or compose files and repeat the the build and run and it will rebuild and rerun the containers. Change directories to buld and run other containers.

# Appendix

## Helpful commands



### Destroy All

This destroys all the containers. USE WITH CAUTION

`docker rm -f $(docker ps -a -q)`

This destroys all your images, however pulling all the images will take a lot of time.

`docker rmi -f $(docker images -a -q)`

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
