#!/usr/bin/ruby



def list_droplets(client)

	# List all droplets
	droplet_ids = []
	client.droplets.all.each_with_index{ |x, i|
	    puts "[" + i.to_s + "]Droplet " + "id: " + x.id.to_s + " name: " + x.name + " region: " + x.region.name
	    droplet_ids << x.id
	}

	if droplet_ids.empty?
		puts "Currently, there are NO droplets..."
	end

	return droplet_ids
end

def select_droplet(client)

droplet_ids = list_droplets(client)

# Get the droplet id
print "Select a droplet:\n"
droplet_index = gets

droplet_id = droplet_ids[droplet_index.to_i]

return droplet_id
end
