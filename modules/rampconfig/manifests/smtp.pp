class rampconfig::smtp {

case $hostname {
        mail: { notice("Welcome stranger") }
	
	default: {


        package { "sendmail-cf": ensure => installed }
	
        exec { "sendmail-update":
                command 	=> "make -C /etc/mail",
		path		=> "/usr/bin/",	
                refreshonly 	=> true,
                subscribe 	=> [ File["/etc/mail/sendmail.mc"], File["/etc/mail/submit.mc"] ],
        }
	
        service { "sendmail":
                ensure 		=> running,
                hasstatus 	=> true,
                enable 		=> true,
                subscribe 	=> [ File["/etc/mail/sendmail.mc"], File["/etc/mail/submit.mc"], Package["sendmail-cf"]],
        }
	
        file { "/etc/mail/sendmail.mc":
                owner   => root,
                group   => root,
                mode    => 644,
                source  => "puppet:///modules/rampconfig/sendmail.mc.$lsbmajdistrelease",
                sourceselect => first
        }
        file { "/etc/mail/submit.mc":
                owner   => root,
                group   => root,
                mode    => 644,
                source  => "puppet:///modules/rampconfig/submit.mc.$lsbmajdistrelease",
                sourceselect => first
        }

	file { "/etc/aliases":
		mode  	=> 644,
		source 	=> "puppet:///modules/rampconfig/aliases",
   		owner 	=> root,
   		group 	=> root,
   		before  => Exec["create aliases db"]
 	}

 	exec { "new_aliases":
   		command => "/usr/bin/newaliases",
   		alias => "create aliases db",
   		subscribe => File["/etc/aliases"],
   		refreshonly => true,
 	}
}
}
}
