#!/usr/bin/ruby

# Install with 'gem install droplet_kit'
require 'droplet_kit'
require './config.rb'

client = DropletKit::Client.new(access_token: @docean_token_v2)

client.ssh_keys.all().each { |x|
	puts "[SSHKey] id: " + x.id.to_s + " , name: " + x.name
}

