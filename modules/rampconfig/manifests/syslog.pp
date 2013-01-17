class rampconfig::syslog {

	 case $operatingsystemrelease {
        /^4.*/: { include  rampconfig::syslog::4 }
        /^5.*/: { include  rampconfig::syslog::5 }
        /^6.*/: { include  rampconfig::syslog::6 } }
}

class rampconfig::syslog::4 {

        package { "sysklogd":
                ensure  => present,
                }

        file { "/etc/syslog.conf":
                owner	=> "root",
                group	=> "root",
                mode	=> "640",
                require	=> Package["sysklogd"],
                source	=> 'puppet:///modules/rampconfig/syslog.conf.4',
        }

        service { "syslog":
                enable    => "true",
                ensure    => "running",
                hasstatus => "true",
                require   => File["/etc/syslog.conf"],
                subscribe => File["/etc/syslog.conf"],
        }
}

class rampconfig::syslog::5 {

	package { "sysklogd":
		ensure	=> present,
		}

        package { "rsyslog":
                ensure  => present,
                }

        file { "/etc/rsyslog.conf":
                owner   => "root",
                group   => "root",
                mode    => "640",
                require => Package["rsyslog"],
                source  => 'puppet:///modules/rampconfig/rsyslog.conf.5',
        }

	file { "/etc/syslog.conf":
                owner   => "root",
                group   => "root",
                mode    => "640",
                require => Package["sysklogd"],
                source  => 'puppet:///modules/rampconfig/syslog.conf.5',
        }


        service { "syslog":
                enable    => "true",
                ensure    => "running",
                hasstatus => "true",
                require   => File["/etc/syslog.conf"],
                subscribe => File["/etc/syslog.conf"],
        }
}

class rampconfig::syslog::6 {

        package { "rsyslog":
                ensure  => present,
                }

        file { "/etc/rsyslog.conf":
                owner   => "root",
                group   => "root",
                mode    => "640",
                require => Package["rsyslog"],
                source  => 'puppet:///modules/rampconfig/rsyslog.conf.6',
        }

        service { "rsyslog":
                enable    => "true",
                ensure    => "running",
                hasstatus => "true",
                require   => File["/etc/rsyslog.conf"],
                subscribe => File["/etc/rsyslog.conf"],
        }
}

