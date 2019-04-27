ImageName?=registry:2
ContainerName?=DockerRegistry
MKFILE := $(abspath $(lastword $(MAKEFILE_LIST)))
CURDIR := $(dir $(MKFILE))



run:
	docker run -d --rm -p 80:5000 -p 443:443 \
	-v ${CURDIR}data:/var/lib/registry \
	-v ${CURDIR}certs:/certs \
	-v ${CURDIR}/auth:/auth \
	--env-file ./envfile \
	--name ${ContainerName} ${ImageName}

stop:
	docker stop ${ContainerName}

