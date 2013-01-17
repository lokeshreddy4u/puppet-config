class monitor::plugins {

        case $architecture {
                x86_64: {

		# exec with the command as the name
		exec { "/sbin/service nrpe reload":
		onlyif => "/bin/grep -c check_nfsmounts100 /usr/lib64/nagios/plugins/check_nfsmounts",
		}		

                file { '/usr/lib64/nagios/plugins':
                owner   => nagios,
                group   => nagios,
                mode    => 0754,
                source  => "puppet:///modules/monitor/plugins",
		require => Exec["/sbin/service nrpe reload"],
                recurse => true,
                }}

                i386: {

		 # exec with the command as the name
                exec { "/sbin/service nrpe reload":
		onlyif => "/bin/grep -c check_nfsmounts100 /usr/lib64/nagios/plugins/check_nfsmounts",
                }

                file { '/usr/lib/nagios/plugins':
                owner   => nagios,
                group   => nagios,
                mode    => 0754,
                source  => "puppet:///modules/monitor/plugins",
		require => Exec["/sbin/service nrpe reload"],
                recurse => true,
                }}
}}

