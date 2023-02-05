FROM debian:buster
LABEL maintainer="debuggerboy` <debuggerboy@gmail.com>"

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Installs the `dpkg-buildpackage` command
RUN apt-get update
RUN apt-get install build-essential debhelper devscripts debian-keyring debian-archive-keyring autoconf automake cmake gettext libtool-bin locales ninja-build pkg-config unzip libtool g++i curl -y

# Install `dh-virtualenv` 1.2
RUN curl --output /tmp/dh-virtualenv.deb https://download.nylas.com/gha-deps/dh-virtualenv_1.2.2-1~buster_all.deb
RUN apt-get install --yes /tmp/dh-virtualenv.deb

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
