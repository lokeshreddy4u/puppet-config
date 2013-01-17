class rampconfig::packages
{
package { "vsftpd": ensure => "installed" }

	case $operatingsystemrelease {
        	/^4.*/: { package { "pdksh": ensure => "installed" } }
        	/^5.*/: { package { "ksh": ensure => "installed" }
			  package { "sysstat": ensure => "installed" } }
        	/^6.*/: { package { "ksh": ensure => "installed" } 
			  package { "unix2dos": ensure => "installed" }
			  package { "dos2unix": ensure => "installed" }
			  package { "sysstat": ensure => "installed" } 
			  package { "telnet": ensure => "installed" }
			  package { "perl-Net-SNMP": ensure => "installed" }
			  package { "perl-Config-General": ensure => "installed" }
			  package { "perl-DateTime": ensure => "installed" }
			  package { "perl-Mail-Sendmail": ensure => "installed" }
			}
			}


}
