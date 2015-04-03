#!/usr/bin/ruby

# Install with 'gem install droplet_kit'
require 'droplet_kit'
require './config.rb'
require './droplet_commons.rb'

# Connection client
client = DropletKit::Client.new(access_token: @docean_token_v2)

# Select name
puts "Reading clients from abmari-clients.txt"
File.readlines('ambari-clients.txt').each do |name|

# Remove \n
name = name.chomp

image  = 'ubuntu-12-04-x64'
region = 'ams2'
size   = '1g'
sshkey = 726646

puts "Selected region      : " + region
puts "Selected size        : " + size
puts "Selected key         : " + sshkey.to_s
puts "Selected droplet name: [" + name + "]"

# TODO fetch SSH keys from digitalocean
droplet = DropletKit::Droplet.new(name: name , region: region, size: '512mb', image: image, ssh_keys: [sshkey.to_s])

client.droplets.create(droplet)



end
