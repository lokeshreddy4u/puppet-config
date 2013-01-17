class rampconfig::sudo {

	case $hostname {
	 /^prod-app.*/,/^ramp-app.*/,/^pod-worker.*/,/^colo-db.*/,/^colo-utils.*/: {
	 	file { '/etc/sudoers':
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0440,
                source  => 'puppet:///modules/rampconfig/sudoers.workers',
	}
	}
	default: { notice("Welcome stranger") }	
}
}
