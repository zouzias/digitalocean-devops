
# Install java, git
include apt,java,git

package { "maven":
  ensure => installed,
}

file { [ "/opt/" ]:
    ensure => "directory",
}

class { 'tomcat':
  install_from_source => false,
}

tomcat::instance { 'default':
  package_name => "tomcat7"
}->
tomcat::service { 'default':
  use_jsvc     => false,
  use_init     => true,
  service_name => 'tomcat7',
}

# Tomcat admin console
package{ "tomcat7-admin" :
	ensure => "installed",
	notify => Tomcat::Service['default']
}

# Setup a username/password : admin/qwerty for admin tomcat console
file{ '/etc/tomcat7/tomcat-users.xml':
	ensure => "present",
	content => file('/root/tomcat-users.xml'),
	notify => Tomcat::Service['default']
}


# Deploy an app
tomcat::war { 'helloServlet.war':
        catalina_base => '/var/lib/tomcat7',
        war_source => '/root/helloServlet.war',
	require => Tomcat::Service['default']
}

