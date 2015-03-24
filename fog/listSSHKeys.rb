#!/usr/bin/ruby

require './config.rb'
require 'fog'

docean = Fog::Compute.new({
  :provider => 'DigitalOcean',
  :digitalocean_api_key   => @docean_api_key, # your API key here
  :digitalocean_client_id => @docean_client_id          # your client key here
})


docean.ssh_keys.each do | key |
   print key.name
end
