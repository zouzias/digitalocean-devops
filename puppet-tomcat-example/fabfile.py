from fabric.api import env
from fabric.operations import run, put, sudo,local

#env.use_ssh_config = True

# CHANGE ME (change the PEM file)
env.user  = 'root'
env.key_filename = '~/.ssh/digitalocean_rsa'

# Populate host names 
with open('tomcat-host.txt') as f:
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


# Deploy
def deploy():
    bootstrap()
    provision()

# Write ssh config 
def write_ssh_config():
    ssh_config = 'StrictHostKeyChecking no\n\n'
    counter = 1
    for host in env.hosts:
        ssh_config += "Host host" + str(counter) + "\n"
        ssh_config += "  User " + env.user + "\n"
        ssh_config += "  HostName " + host + "\n"
        ssh_config += "  IdentityFile " + env.key_filename + "\n\n"
        counter += 1
    copy_ssh_key()
    run("echo '%s' > ~/.ssh/config" % ssh_config)

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
    put('tomcat-users.xml', '/root/')
    put('helloServlet.war', '/root/')
    
def apt_update():
    sudo('sudo dpkg --configure -a')
    sudo('apt-get update')
    sudo('apt-get -qy upgrade')

def uptime():
    run('uptime')

def reboot():
    sudo('reboot')
