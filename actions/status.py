import digitalocean


with open ("token-api.txt", "r") as file:
    token = file.read()
    manager = digitalocean.Manager(token=token)

    my_droplets = manager.get_all_droplets()
    for droplet in my_droplets:
        print "Droplet:" + str(droplet)
        actions = droplet.get_actions()
        for action in actions:
            action.load()
            # Once it shows complete, droplet is up and running
            print "Action " + str(action) + " is " + str(action.status)
