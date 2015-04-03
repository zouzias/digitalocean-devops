#!/usr/bin/ruby

# Delete a digitalocean droplet

# Install with 'gem install droplet_kit'
require 'droplet_kit'
require './config.rb'
require './droplet_commons.rb'

# Connection client
client = DropletKit::Client.new(access_token: @docean_token_v2)


# Get the droplet id
droplet_id = select_droplet(client)

droplet_id = droplet_id.to_s

if !droplet_id.empty?
   droplet = client.droplets.find(id: droplet_id)
   print droplet.inspect

	puts
puts

   print droplet.status.inspect

end

