#!/bin/bash

source bin/utils.sh
function INSTALL_GOLANG() {
which "sudo" > /dev/null 2>&1
if [[ "$?" = 0 ]] ; then
  ISUDO="sudo"
else
  ISUDO=""
fi

# Make sure that you are in the home (~) directory
RUN_COMMAND cd ~

# Use curl to retrieve the tarball
RUN_COMMAND curl -O https://dl.google.com/go/go1.16.3.linux-amd64.tar.gz

# Extract the downloaded archive and install it to the desired location on the system. It’s considered best practice to keep it under /usr/local
RUN_COMMAND $ISUDO tar -xvf go1.12.1.linux-amd64.tar.gz -C /usr/local

# Recursively change this directory’s owner and group to root
RUN_COMMAND $ISUDO chown -R root:root /usr/local/go

# Create the directory structure for your Go workspace
RUN_COMMAND mkdir -p $HOME/go/{bin,src}

# set your $GOPATH by adding the global variables to your ~/.profile. You may want to add this into .zshrc or .bashrc file as per your shell configuration
RUN_COMMAND echo "export GOPATH=$HOME/go" >> ~/.profile
RUN_COMMAND echo "export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin" >> ~/.profile
RUN_COMMAND ~/.profile
}