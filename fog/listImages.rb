#!/usr/bin/ruby

require './config.rb'
require 'fog'

docean = Fog::Compute.new({
  :provider => 'DigitalOcean',
  :digitalocean_api_key   => @docean_api_key, # your API key here
  :digitalocean_client_id => @docean_client_id          # your client key here
})


docean.images.each_with_index do |image, i|
   print "[" + i.to_s + "] "
   puts image.name.to_s + image.distribution.to_s
end

