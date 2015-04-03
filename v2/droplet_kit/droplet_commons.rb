#!/usr/bin/ruby





def list_regions(client)
        region_ids = []

        # List all regions
        client.regions.all.each_with_index{ |x, i|
	    puts "[" + i.to_s + "] slug: " + x.slug  + " name: " + x.name + " sizes: " + x.sizes.to_s + " available: " + x.available.to_s
            region_ids << x.slug
        }

        return region_ids
end

def list_sizes(client, region_slug)

	# List all regions
        sizes = []
        client.regions.all.each_with_index{ |x, i|
		if x.slug == region_slug
			x.sizes.each_with_index{ |x, i|
				puts "[" + i.to_s + "] size : " + x
				sizes << x
			}
			break
		end
        }

	return sizes;
end


def list_images(client)
	image_ids = []

	# List all images
	client.images.all.each_with_index{ |x, i|
	    puts "[" + i.to_s + "] Image " + "id: " + x.id.to_s + " distribution: " + x.distribution  + " name: " + x.name
	    image_ids << x.id
	}

	return image_ids
end

def list_droplets(client)
	# List all droplets
	droplet_ids = []
	client.droplets.all.each_with_index{ |x, i|
	    puts "[" + i.to_s + "] Droplet " + "id: " + x.id.to_s + " name: " + x.name + " memory: " + x.memory.to_s + " region: " + x.region.name
	    droplet_ids << x.id
	}

	if droplet_ids.empty?
		puts "Currently, there are NO droplets..."
	end

	return droplet_ids
end


def select_option(array)
	# Get the droplet id
	print "Select a number [0 - " + array.length.to_s + "]\n"
	index = gets

	id = array[index.to_i]

	return id
end

def select_droplet(client)
	droplet_ids = list_droplets(client)
	return select_option(droplet_ids)
end

def select_image(client)
	ids = list_images(client)
	return select_option(ids)
end
def select_region(client)
	ids = list_regions(client)
	return select_option(ids)
end
