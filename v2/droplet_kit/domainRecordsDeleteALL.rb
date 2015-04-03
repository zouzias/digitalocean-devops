#!/usr/bin/ruby

# Install with 'gem install droplet_kit'
require 'droplet_kit'
require './config.rb'
require './droplet_commons.rb'

# Connection client
client = DropletKit::Client.new(access_token: @docean_token_v2)

domain = 'zouzias.org'

# List all images
domainRecs = list_domainRecords(client, domain)

domainRecs.each{ |id|
	puts "Deleting record " + id.to_s + " form domain " + domain
	response = client.domain_records.delete(for_domain: domain, id: id)
	puts  "Success: " + response.inspect
}
