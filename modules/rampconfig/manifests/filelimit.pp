class rampconfig::filelimit {

 case $hostname {
        /^pod-worker.*/,/^ramp-app.*/,/^prod-app.*/,/^colo-ac.*/: { 
		
		file { '/etc/security/limits.conf':
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0644,
                source  => 'puppet:///modules/rampconfig/limits.conf',
}
		
		}

	default: { notice("Welcome stranger") }
 }
}

