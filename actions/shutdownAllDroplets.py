import digitalocean
manager = digitalocean.Manager(token="XXX")
my_droplets = manager.get_all_droplets()
for droplet in my_droplets:
    droplet.shutdown()
