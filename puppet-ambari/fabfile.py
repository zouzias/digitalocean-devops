from fabric.api import env
from fabric.operations import run, put, sudo,local

#env.use_ssh_config = True

# CHANGE ME (change the PEM file)
env.user  = 'root'
env.key_filename = '~/.ssh/digitalocean_rsa'

# Populate host names 
with open('ambari-server.txt') as f:
    env.hosts = f.readlines()

def check_bash():
    run('curl https://shellshocker.net/shellshock_test.sh | bash')

##############################
# Install puppet etc
##############################
def init():
    apt_update()
    sudo('apt-get install bash')
    put('puppet-bootstrap.sh', '/root/', use_sudo=True)
    sudo('sh puppet-bootstrap.sh')

def clients():
    with open('ambari-clients.txt') as f:
        env.hosts = f.readlines()

# Deploy
def deploy():
    bootstrap()
    provision()

# Copy ssh key (from env.key_filename)
def copy_ssh_key():
   put(env.key_filename, '~/.ssh/',  mode=0600)

# Bootstrap VMs (copy ssh keys, ssh config, files and install puppet)
def bootstrap():
    write_ssh_config()
    copy_files()

# Apply provisioning with puppet
def provision():
    sudo('puppet apply --modulepath /etc/puppet/modules/ /etc/puppet/manifests/default.pp')

# Copy files puppet related files
def copy_files():
    put('default.pp', '/etc/puppet/manifests/', use_sudo=True)
    
def apt_clean():
    sudo('sudo dpkg --configure -a')

def apt_update():
    sudo('apt-get update')
    sudo('apt-get -qy upgrade')

def uptime():
    run('uptime')

def install_ntp():
   sudo('apt-get install -y ntp')

def reboot():
    sudo('reboot')
