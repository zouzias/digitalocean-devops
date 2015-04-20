#!/bin/bash

# Connect to Tomcat server

HOST=`cat tomcat-host.txt`
KEY='/Users/zouzias/.ssh/digitalocean_rsa'

echo "KEY ${KEY}"
echo "HOST ${HOST}"

ssh -i ${KEY}  root@${HOST}

