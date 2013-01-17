class rampconfig::timeserver {
      case $hostname {
        puppet,/^colo-utils.*/: { include ntp::server } 
	default: { include ntp::client }
}
}

class ntp::server {
	package { 'ntp':
                ensure  => "latest",
        }

	file { '/etc/ntp.conf':
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0644,
                source  => 'puppet:///modules/rampconfig/ntp.conf.master',
                notify  => Service['ntpd'],
        }

        service { 'ntpd':
                require         => Package['ntp'],
                ensure          => running,
                enable          => true,
                hasstatus       => true,
                hasrestart      => true,
        }

}

class ntp::client {
        package { 'ntp':
                ensure  => "latest",
        }

        file { '/etc/ntp.conf':
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0644,
                source  => 'puppet:///modules/rampconfig/ntp.conf.slave',
                notify  => Service['ntpd'],
        }

        service { 'ntpd':
                require         => Package['ntp'],
                ensure          => running,
                enable          => true,
                hasstatus       => true,
                hasrestart      => true,
        }

}

