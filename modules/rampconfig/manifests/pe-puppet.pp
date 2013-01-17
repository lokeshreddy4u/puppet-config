class rampconfig::pe-puppet {

	exec { "remove_pe-puppet":
    		command => "/bin/rm -Rf /var/log/pe-puppet",
		path	=> "/bin/",
    		onlyif 	=> "/usr/bin/test -d /var/log/pe-puppet"
	}

	exec { "remove_puppet_logrotate":
		command => "/bin/rm -f /etc/logrotate.d/pe-puppet",
                path    => "/bin/",
                onlyif  => "/usr/bin/test -f /etc/logrotate.d/pe-puppet"
        }

	exec { "remove_mcollective_logrotate":
                command => "/bin/rm -f /etc/logrotate.d/mcollective",
                path    => "/bin/",
                onlyif  => "/usr/bin/test -f /etc/logrotate.d/mcollective"
        }

#	 exec { "remove_tomcatlogs":
#                command => "/bin/rm -f /etc/cron.daily/tomcatlogs",
#                path    => "/bin/",
#                onlyif  => "/usr/bin/test -f /etc/cron.daily/tomcatlogs"
#        }

#	 exec { "remove_tomcat":
#                command => "/bin/rm -f /etc/logrotate.d/tomcat",
#                path    => "/bin/",
#               onlyif  => "/usr/bin/test -f /etc/logrotate.d/tomcat"
#        }

	exec { "remove_certwatch":
		command => "/bin/rm -f /etc/cron.daily/certwatch",
                path    => "/bin/",
                onlyif  => "/usr/bin/test -f /etc/cron.daily/certwatch"
        }
}
