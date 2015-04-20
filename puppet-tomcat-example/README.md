# Apache Tomcat Server in ZC2

Scripts to deploy an apache tomcat server to zc2.ibm.com. It utilizes 'fabric' and 'puppet'.

Apache Tomcat 7 will be installed.

## Setup:

#### First, put your credentials in `config.rb`

Edit the following file accordingly:

```
#!/usr/bin/ruby

@openstack_api_key  = 'XXXX'
@openstack_username = 'azo@zurich.ibm.com'
@openstack_tenant   = 'zrlindexer'
@ssh_key_name       = 'zrlindexer-key'
```
Note the ssh_key_name should correspond to the name of the key which can be found in zc2.ibm.com
#### SSH key for `fabric`

Change the following line in `fabfile.py` to point to the ssh key associated with the above VMs. 
`env.key_filename = '~/.ssh/zc2_rsa'`

## How to setup Apache tomcat and deploy a simple WAR application

First, run the following fog script to create a VM under zc2 with hostname tomcat.your_user_name.zc2.ibm.com.

```
ruby createTomcatServer.rb
```

Then, Run ``fab init`` and ``fab deploy`` to install apache tomcat into the VMS.

## Requirements:

* Install Ruby
* Install fog (`gem install fog`)
* Install python >= 2.7.
* Install fabric, i.e., `pip install fabric` (http://www.fabfile.org/en/latest/).


### Optional - Advanced


#### Admin Tomcat console 

You can access the admin tomcat console by

```
http://tomcat.your_user_name.zc2.ibm.com:8080/manager/html
```

with username `admin` and password `qwerty`.

### A simple war application will be deployed (see `default.pp`)

Hit the following address to see the application running
```
http://tomcat.your_user_name.zc2.ibm.com:8080/helloServlet/HelloServlet/
```

