# Apache Tomcat Server in Digitalocean

Scripts to deploy an apache tomcat server to digitalocean. It utilizes 'fabric' and 'puppet'.

Apache Tomcat 7 will be installed.

#### Create a droplet on Digitalocean

First create an Ubuntu 14.10 droplet on digitalocean, say example.com.

#### SSH key for `fabric`

Change the following line in `fabfile.py` to point to the ssh key associated with the above VMs. 
`env.key_filename = '~/.ssh/digitalocean_rsa'`

## How to setup Apache tomcat and deploy a simple WAR application

Then, Run ``fab init`` and ``fab deploy`` to install apache tomcat into the VMS.

## Requirements:

* Install python >= 2.7.
* Install fabric, i.e., `pip install fabric` (http://www.fabfile.org/en/latest/).


### Optional - Advanced

#### Admin Tomcat console 

You can access the admin tomcat console by

```
http://example.com:8080/manager/html
```

with username `admin` and password `qwerty`.

### A simple war application will be deployed (see `default.pp`)

Hit the following address to see the application running
```
http://example.com:8080/helloServlet/HelloServlet/
```

