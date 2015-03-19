import digitalocean

with open ("token-api.txt", "r") as file:
    token = file.read()
    manager = digitalocean.Manager(token=token)
    my_droplets = manager.get_all_droplets()
    for droplet in my_droplets:
        droplet.shutdown()
