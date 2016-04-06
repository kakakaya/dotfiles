#!/bin/bash
# -*- mode:shell-script; coding:utf-8 -*-
# Author: kakakaya, Date: Wed Apr  6 13:33:04 2016

# RUN with sudo!


# If you haven’t already done so, log into your machine as a user with sudo or root privileges.

# Open a terminal window.

# Purge any older repositories.

apt-get purge lxc-docker*
apt-get purge docker.io*
# Update package information, ensure that APT works with the https method, and that CA certificates are installed.

apt-get update
apt-get install apt-transport-https ca-certificates
# Add the new GPG key.

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
# Open the /etc/apt/sources.list.d/docker.list file in your favorite editor.

# If the file doesn’t exist, create it.

# Remove any existing entries.

# Add an entry for your Debian operating system.

# The possible entries are:

# On Debian Wheezy

# deb https://apt.dockerproject.org/repo debian-wheezy main
# On Debian Jessie

# deb https://apt.dockerproject.org/repo debian-jessie main
# On Debian Stretch/Sid

# deb https://apt.dockerproject.org/repo debian-stretch main

# Note: Docker does not provide packages for all architectures. To install docker on a multi-architecture system, add an [arch=...] clause to the entry. Refer to the Debian Multiarch wiki for details.

# Save and close the file.
echo "deb https://apt.dockerproject.org/repo debian-jessie main" >> /etc/apt/sources.list


# Update the APT package index.

apt-get update
# Verify that APT is pulling from the right repository.

apt-cache policy docker-engine
# From now on when you run apt-get upgrade, APT pulls from the new apt repository.

# Install Docker
# Before installing Docker, make sure you have set your APT repository correctly as described in the prerequisites.

# Update the APT package index.

sudo apt-get update
# Install Docker.

sudo apt-get install docker-engine
# Start the docker daemon.

sudo service docker start
# Verify docker is installed correctly.

sudo docker run hello-world
