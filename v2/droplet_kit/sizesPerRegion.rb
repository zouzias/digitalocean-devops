#!/usr/bin/ruby

# Install with 'gem install droplet_kit'
require 'droplet_kit'
require './config.rb'
require './droplet_commons.rb'

# Connection client
client = DropletKit::Client.new(access_token: @docean_token_v2)


region_slug = select_region(client)

# List all sizes of a region
list_sizes(client, region_slug)

