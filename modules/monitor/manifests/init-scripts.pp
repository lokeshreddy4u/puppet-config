class monitor::init-scripts {

		exec { "create_needed_tomcat":
    		command => "/usr/bin/test -f /etc/init.d/tomcat",
		}

                file { '/etc/init.d/tomcat':
                owner   => root,
                group   => root,
                mode    => 0755,
		source  => "puppet:///modules/monitor/tomcat",
                require => Exec["create_needed_tomcat"],
                }

		exec { "create_needed_podzinger":
                command => "/usr/bin/test -f /etc/init.d/podzinger",
                }

		file { '/etc/init.d/podzinger':
                owner   => root,
                group   => root,
                mode    => 0755,
                source  => "puppet:///modules/monitor/podzinger",
                require => Exec["create_podzinger"],
                }}

