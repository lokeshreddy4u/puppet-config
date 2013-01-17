class apache::http-config {

case $hostname {
	/^prod-app.*/: {

		package { "httpd":
		ensure	=> present,
		before	=> Service["httpd"],
		}

		service { "httpd":
    		ensure  => "running",
    		enable  => "true",
		hasrestart => "true",
		}		

		exec { "reload":
                command => "/etc/init.d/httpd reload",
                refreshonly => true,
                require => Service[[httpd]],
        	}

		file { "/etc/httpd/conf/httpd.conf":
		notify  => Exec[[reload]],
		ensure  => file,
        	owner   => root,
        	group   => root,
        	mode    => 0666,
    		source => 'puppet:///modules/apache/httpd.conf.prod',
		}
	}

	/^colo-ac.*/: {

		package { "httpd":
                ensure  => present,
                before  => Service["httpd"],
                }

                service { "httpd":
                ensure  => "running",
                enable  => "true",
                hasrestart => "true",
                }

                exec { "reload":
                command => "/etc/init.d/httpd reload",
                refreshonly => true,
                require => Service[[httpd]],
                }

                file { "/etc/httpd/conf/httpd.conf":
                notify  => Exec[[reload]],
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0666,
                source => 'puppet:///modules/apache/httpd.conf.colo',
                }

        }

	ramp-app-12,ramp-app-13: {

		package { "httpd":
                ensure  => present,
                before  => Service["httpd"],
                }

                service { "httpd":
                ensure  => "running",
                enable  => "true",
                hasrestart => "true",
                }

                exec { "reload":
                command => "/etc/init.d/httpd reload",
                refreshonly => true,
                require => Service[[httpd]],
                }

                file { "/etc/httpd/conf/httpd.conf":
                notify  => Exec[[reload]],
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0666,
                source => 'puppet:///modules/apache/httpd.conf.12-13',
                }
        }
	

	ramp-app-14,ramp-app-15: {
	
		package { "httpd":
                ensure  => present,
                before  => Service["httpd"],
                }

                service { "httpd":
                ensure  => "running",
                enable  => "true",
                hasrestart => "true",
                }

                exec { "reload":
                command => "/etc/init.d/httpd reload",
                refreshonly => true,
                require => Service[[httpd]],
                }

                file { "/etc/httpd/conf/httpd.conf":
                notify  => Exec[[reload]],
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0666,
                source => 'puppet:///modules/apache/httpd.conf.14-15',
                }
        }


	ramp-app-16: {

		package { "httpd":
                ensure  => present,
                before  => Service["httpd"],
                }

                service { "httpd":
                ensure  => "running",
                enable  => "true",
                hasrestart => "true",
                }

                exec { "reload":
                command => "/etc/init.d/httpd reload",
                refreshonly => true,
                require => Service[[httpd]],
                }

                file { "/etc/httpd/conf/httpd.conf":
                notify  => Exec[[reload]],
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0666,
                source => 'puppet:///modules/apache/httpd.conf.16',
                }
        }

	default: { notice("Welcome stranger") }
}}
