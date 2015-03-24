#!/usr/bin/ruby

require './config.rb'
require 'fog'

docean = Fog::Compute.new({
  :provider => 'DigitalOcean',
  :digitalocean_api_key   => @docean_api_key, # your API key here
  :digitalocean_client_id => @docean_client_id          # your client key here
})



docean.servers.each do |server|
  # remember, servers are droplets
  server.id
  server.name
  server.state
  server.backups_enabled
  server.image_id
  server.flavor_id # server 'size' in DigitalOcean's API parlance
  server.region_id
end
