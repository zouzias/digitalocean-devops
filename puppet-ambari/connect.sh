#!/bin/bash

HOST=`cat ambari-server.txt`
KEY='/Users/zouzias/.ssh/digitalocean_rsa'

echo "KEY ${KEY}"
echo "HOST ${HOST}"

ssh -i ${KEY}  root@${HOST}

