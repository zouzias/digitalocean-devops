

import digitalocean

with open ("token-api.txt", "r") as file:
    token = file.read()
    droplet = digitalocean.Droplet(token = token,
                               name='hostname',
                               region='nyc2', # New York 2
                               image='ubuntu-14-04-x64', # Ubuntu 14.04 x64
                               size_slug='512mb',  # 512MB
                               backups=False)
    droplet.create()
