#base image :alpine is a minimal Docker image based on Alpine Linux.
# It is often used as a base image for building lightweight containers.
FROM alpine
#PACKAGE MANAGER: apk is the package manager for Alpine Linux, used to install and manage software packages.
#run: This command is used to execute a command in the Docker image during the build process.
RUN apk add --update  redis

#cmd: This command copies the redis.conf file from the current directory on the host system to the /etc/redis/ directory in the Docker image. 

CMD [ "redis-server" ]