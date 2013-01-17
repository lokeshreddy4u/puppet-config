class dell::snmp
{

	package { "net-snmp":
    		ensure => "installed"
	}
	
	service { "snmpd":
    		ensure  => "running",
    		enable  => "true",
    		require => Package["net-snmp"],
	}

 case $operatingsystemrelease {
        /^5.*/, /^6.*/: { include  dell::snmp::6 }
        default: { include dell::snmp::4 }
 }

class dell::snmp::6
{

	case $hostname {
	mail: { notice("Welcome stranger") }
	default : {

	file { "/etc/snmp/snmpd.conf":
    		notify  => Service["snmpd"],  # this sets up the relationship
    		mode    => 644,
    		owner   => "root",
    		group   => "root",
    		require => Package["net-snmp"],
		source  => 'puppet:///modules/dell/snmpd.conf.el6',
	}
}
}
}

class dell::snmp::4
{

        file { "/etc/snmp/snmpd.conf":
                notify  => Service["snmpd"],  # this sets up the relationship
                mode    => 644,
                owner   => "root",
                group   => "root",
                require => Package["net-snmp"],
                source  => 'puppet:///modules/dell/snmpd.conf.el4',
        }
}


#	if ( $manufacturer == "Dell Inc." ) {
           
#		exec { "enable_openmanage_snmp":
#                command => "/etc/init.d/dataeng enablesnmp",
#                path    => "/usr/local/bin/:/bin/",
#        }
#        }

}
