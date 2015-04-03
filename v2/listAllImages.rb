#!/usr/bin/ruby

# Install with 'gem install droplet_kit'
require 'droplet_kit'
require './config.rb'

# Connection client
client = DropletKit::Client.new(access_token: @docean_token_v2)


# List all images
client.images.all.each{ |x|
    puts "Image " + "id: " + x.id.to_s + " distribution: " + x.distribution  + " name: " + x.name
}
