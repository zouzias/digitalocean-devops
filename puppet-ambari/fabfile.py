from fabric.api import env
from fabric.operations import run, put, sudo,local

#env.use_ssh_config = True

# CHANGE ME (change the PEM file)
env.user  = 'root'
env.key_filename = '~/.ssh/digitalocean_rsa'

# Populate host names 
with open('ambari-server.txt') as f:
    env.hosts = f.readlines()

##############################
# Install puppet etc
##############################
def init():
    put('ambari.list', '/etc/apt/sources.list.d/', use_sudo=True)
    sudo('apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD')
    apt_update()
    sudo('apt-get install -qy ambari-server')
    sudo('ambari-server setup --silent')
    ambari_start()

def ambari_start():
    sudo('ambari-server start')

def clients():
    with open('ambari-clients.txt') as f:
        env.hosts = f.readlines()

# Copy files puppet related files
def copy_files():
    put('default.pp', '/etc/puppet/manifests/', use_sudo=True)
    
def apt_clean():
    sudo('sudo dpkg --configure -a')

def apt_update():
    sudo('apt-get update')

def apt_upgrade():
    sudo('apt-get -qy upgrade')

def uptime():
    run('uptime')

def install_ntp():
   sudo('apt-get install -y ntp')

def reboot():
    sudo('reboot')
