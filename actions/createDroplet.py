#!/usr/local/bin/python

# Creates a digitalocean droplet
# Usage: ./createDroplet example.com


# TODO parametrize region, etc.

import sys,digitalocean

argc = len(sys.argv)
print "# of arguments: " + str(argc)
if argc < 2:
    print "Usage: " + sys.argv[0] + " example.com" 
    exit(-1)

# Get first argument
hostname = sys.argv[1]

print "Creating droplet with hostname: " + hostname

with open ("token-api.txt", "r") as file:
    token = file.read().replace('\n', '')
    print "Using API token: " + token
    droplet = digitalocean.Droplet(token=token,
                               name=hostname,
                               region='nyc2', # New York 2
                               image='ubuntu-14-04-x64', # Ubuntu 14.04 x64
                               size_slug='512mb',  # 512MB
                               backups=False)
    droplet.create()
