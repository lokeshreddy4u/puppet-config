# FAST Servers host file
class rampconfig::hosts {
	
	case $hostname {
	/^fast.*/: {
         file { '/etc/hosts':
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0644,
                source  => 'puppet:///modules/rampconfig/etc/hosts',
        }
	}
	/^pod-worker.*/: {
	 	host { 'poc.everyzing.com':
    		ip => '192.168.24.145',
		}

		host { 'poc.ramp.com':
                ip => '192.168.24.145',
                }
	
		host { 'dataservices.everyzing.com':
                ip => '192.168.24.145',
		host_aliases => 'dataservices.ramp.com',
                }

		host { 'publishing.everyzing.com':
                ip => '192.168.24.145',
                host_aliases => 'publishing.ramp.com',
                }
	        }	
}
}


