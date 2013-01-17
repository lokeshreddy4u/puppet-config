class rampconfig::ldapconfig {

         case $operatingsystemrelease {
        /^6.*/: { 
		
		exec { "ldapfix":
    		command => "sh /net/san/nfs_arc02/home/lreddy/ldap_fix.sh",
    		path    => "/bin/",
		}
		}
	default: { notice("Welcome stranger") }
	
		}
}
