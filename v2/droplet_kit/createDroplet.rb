#!/usr/bin/ruby

# Install with 'gem install droplet_kit'
require 'droplet_kit'
require './config.rb'

# Connection client
client = DropletKit::Client.new(access_token: @docean_token_v2)

# TODO fetch SSH keys from digitalocean
droplet = DropletKit::Droplet.new(name: 'zouzias.org', region: 'ams2', size: '512mb', image: 'ubuntu-14-04-x64', ssh_keys: ['726646'])

client.droplets.create(droplet)

