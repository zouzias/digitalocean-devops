#!/usr/bin/ruby

# Install with 'gem install droplet_kit'
require 'droplet_kit'
require './config.rb'

# Connection client
client = DropletKit::Client.new(access_token: @docean_token_v2)


# List all regions
client.regions.all.each{ |x|
    puts "slug: " + x.slug  + " name: " + x.name + " sizes: " + x.sizes.to_s + " available: " + x.available.to_s
}
