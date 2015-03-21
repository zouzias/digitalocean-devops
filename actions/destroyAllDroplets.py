#!/usr/local/bin/python

import digitalocean

with open ("token-api.txt", "r") as file:
    token = file.read().replace('\n', '')
    print "Using API token: " + token
    manager = digitalocean.Manager(token=token)
    my_droplets = manager.get_all_droplets()
    print str(len(my_droplets)) + " droplets found..."
    for droplet in my_droplets:
        print "Destroying droplet" + str(droplet)
        droplet.destroy()
