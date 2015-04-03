#!/usr/bin/ruby

# Install with 'gem install droplet_kit'
require 'droplet_kit'
require './config.rb'
require './droplet_commons.rb'

# Connection client
client = DropletKit::Client.new(access_token: @docean_token_v2)


# List all images
list_images(client)
