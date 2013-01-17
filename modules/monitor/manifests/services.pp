class monitor::services {

	 case $operatingsystemrelease {
        /^4.*/: { 
		include monitor::services::sshd 
		include monitor::services::screen
		}

        /^5.*/: { 
		include monitor::services::sshd
		include monitor::services::screen
		include monitor::services::nrpe
		}

        /^6.*/: { 
		include monitor::services::sshd
		include monitor::services::screen
		include monitor::services::nslcd
		include monitor::services::nrpe
		}
 	}
}

class monitor::services::sshd {
  	service {"sshd":
    	enable		=> true,
    	ensure		=> running,
    	hasrestart 	=> true,
    	hasstatus 	=> true,
    	require 	=> Package["openssh"]
  	}	
  
  	package {"openssh":
    	ensure 		=> "latest"
  	}
}

class monitor::services::screen {
	package {"screen":
	ensure		=> "latest"
	}
}

class monitor::services::nslcd {
        service {"nslcd":
        enable          => true,
        ensure          => running,
        hasrestart      => true,
        hasstatus       => true,
        require         => Package["nss-pam-ldapd"]
        }

	service {"nscd":
        enable          => true,
        ensure          => running,
	}
 
        package {"nss-pam-ldapd":
        ensure          => "latest"
        }
}

class monitor::services::nrpe {

	package {"rpmforge-release":
	ensure		=> "latest"
	}

        service {"nrpe":
        enable          => true,
        ensure          => running,
        hasrestart      => true,
        hasstatus       => true,
        require         => Package["nagios-nrpe"]
        }
 
        package {"nagios-nrpe":
        ensure          => "latest"
        }

	file {"/etc/nagios/nrpe.cfg":
   	ensure 		=> "link",
   	target 		=> "/net/san/nfs0/home/nagios/nrpe.cfg",
	require		=> Package["nagios-nrpe"],
	}

	file {"/etc/nagios/nrpe_local.cfg":
	ensure		=> "link",
	target		=> "/net/san/nfs0/home/nagios/nrpe_local.cfg",
	}
}


