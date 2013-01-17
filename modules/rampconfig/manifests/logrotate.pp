class rampconfig::logrotate {

	 case $operatingsystemrelease {
        /^4.*/: { include  rampconfig::logrotate::4 }
        /^5.*/: { include  rampconfig::logrotate::5 }
        /^6.*/: { include  rampconfig::logrotate::6 } }
}

class rampconfig::logrotate::4 {

        package { "logrotate":
                ensure  => present,
                }

        file { "/etc/logrotate.conf":
                owner	=> "root",
                group	=> "root",
                mode	=> "644",
                require	=> Package["logrotate"],
                source	=> 'puppet:///modules/rampconfig/logrotate.conf.4',
        }

	file { "/etc/logrotate.d/puppet":
                owner   => "root",
                group   => "root",
                mode    => "644",
                require => Package["logrotate"],
                source  => 'puppet:///modules/rampconfig/log.puppet.4',
        }

}

class rampconfig::logrotate::5 {

	package { "logrotate":
		ensure	=> present,
		}

        file { "/etc/logrotate.conf":
                owner   => "root",
                group   => "root",
                mode    => "644",
                require => Package["logrotate"],
                source  => 'puppet:///modules/rampconfig/logrotate.conf.5',
        }

	file { "/etc/logrotate.d/puppet":
                owner   => "root",
                group   => "root",
                mode    => "644",
                require => Package["logrotate"],
                source  => 'puppet:///modules/rampconfig/log.puppet.5',
        }

}

class rampconfig::logrotate::6 {

        package { "logrotate":
                ensure  => present,
                }

        file { "/etc/logrotate.conf":
                owner   => "root",
                group   => "root",
                mode    => "644",
                require => Package["logrotate"],
                source  => 'puppet:///modules/rampconfig/logrotate.conf.6',
        }
	
	file { "/etc/logrotate.d/puppet":
                owner   => "root",
                group   => "root",
                mode    => "644",
                require => Package["logrotate"],
                source  => 'puppet:///modules/rampconfig/log.puppet.5',
        }


}

