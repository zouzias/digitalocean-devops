# digitalocean-devops
Devops with [digitalocean](https://www.digitalocean.com)'s cloud provide

Tools for accessing digitalocean's droplets using v2 API and [droplet_kit](https://github.com/digitalocean/droplet_kit).

### Configuration

Install gem `droplet_kit`

```
gem install droplet_kit
```

Place your v2 token API in

```
https://github.com/zouzias/digitalocean-devops/blob/master/v2/droplet_kit/config.rb
```

Then, you can use the following list of commands:  [v2](https://github.com/zouzias/digitalocean-devops/tree/master/v2/droplet_kit)

### Commands
* domains.rb
* createDroplet.rb 
* regions.rb
* deleteDroplet.rb 
* droplets.rb     
* sizesPerRegion.rb
* domainRecordsDeleteALL.rb  
* images.rb          
* sshKeys.rb
* domainRecords.rb 
* inspectDroplet.rb
