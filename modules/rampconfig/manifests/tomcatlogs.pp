class rampconfig::tomcatlogs {

	file { '/var/tmp/log.tomcat':
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0755,
                source  => 'puppet:///modules/rampconfig/log.tomcat',
        }

	file { '/var/tmp/cron.tomcatlogs':
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0755,
                source  => 'puppet:///modules/rampconfig/cron.tomcatlogs',
        }

	exec { "create_tomcatlogs":
    	command 	=> "/bin/cat /var/tmp/log.tomcat > /etc/logrotate.d/tomcat",
	path		=> "/bin",
	creates 	=> "/etc/logrotate.d/tomcat",
	onlyif		=> "/usr/bin/test -d /home/tomcat/logs"
	}

	exec { "create_tomcatcron":
	command         => "/bin/cat /var/tmp/cron.tomcatlogs > /etc/cron.daily/tomcatlogs",
        path            => "/bin",
	creates         => "/etc/cron.daily/tomcatlogs",
        onlyif          => "/usr/bin/test -d /home/tomcat/logs"
        }

	exec { "execute_tomcatcron":
        command         => "/bin/chmod +x /etc/cron.daily/tomcatlogs",
        path            => "/bin",
        onlyif          => "/usr/bin/test -f /etc/cron.daily/tomcatlogs"
        }


}
