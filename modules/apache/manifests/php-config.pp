class apache::php-config {

case $hostname {
	/^prod-app.*/,/^ramp-app.*/,/^colo-ac.*/: {
		file { "/etc/php.ini":
		ensure  => file,
        	owner   => root,
        	group   => root,
        	mode    => 0644,
    		source => 'puppet:///modules/apache/php.ini',
	}}

	default: { notice("Welcome stranger") }
}}
