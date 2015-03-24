require 'fog'

docean = Fog::Compute.new({
  :provider => 'DigitalOcean',
  :digitalocean_api_key   => 'b186e1ca2928bb56fe6c9c5c1533c6c6', # your API key here
  :digitalocean_client_id => '1368a5b6f9367dcdfd78034138339c86'          # your client key here
})


docean.servers.each do |server|
  # remember, servers are droplets
  server.id
  server.name
  server.state
  server.backups_enabled
  server.image_id
  server.flavor_id # server 'size' in DigitalOcean's API parlance
  server.region_id
end
