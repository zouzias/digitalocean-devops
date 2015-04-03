#!/usr/bin/ruby

# Install with 'gem install droplet_kit'
require 'droplet_kit'
require './config.rb'
require './droplet_commons.rb'

# Connection client
client = DropletKit::Client.new(access_token: @docean_token_v2)

# Select region
sshkey = select_sshkey(client)

# Select region
region = select_region(client)

puts "Selected region: " + region

# Select size
size = select_size(client, region)

puts "Selected size: " + size

# Select name
puts "Select name of droplet"
name = gets.chomp 

puts "Selected region      : " + region
puts "Selected size        : " + size
puts "Selected key         : " + sshkey.to_s
puts "Selected droplet name: [" + name + "]"

# TODO fetch SSH keys from digitalocean
droplet = DropletKit::Droplet.new(name: name , region: region, size: '512mb', image: 'ubuntu-14-04-x64', ssh_keys: [sshkey.to_s])

client.droplets.create(droplet)

