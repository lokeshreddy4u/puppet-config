class monitor::eventhandler {

	case $architecture {
		x86_64: {
		
		file { '/usr/lib64/nagios/plugins/eventhandler':
                owner   => nagios,
                group   => nagios,
                mode    => 0754,
                source  => "puppet:///modules/monitor/eventhandler",
		recurse => true,
        	}}

		i386: {
		
		file { '/usr/lib/nagios/plugins/eventhandler':
                owner   => nagios,
                group   => nagios,
                mode    => 0754,
                source  => "puppet:///modules/monitor/eventhandler",
                recurse => true,
                }}
}}		
