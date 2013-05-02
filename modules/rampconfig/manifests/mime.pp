class rampconfig::mime {

 case $hostname {
        /^ramp-app.*/,/^prod-app.*/,/^colo-ac.*/,/^colo-mcloud.*/: { 
		

		exec { "http_reload":
                command => "/etc/init.d/httpd reload",
                refreshonly => true,
        	}

		file { "/etc/mime.types":
		notify  => Exec[[http_reload]],
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0644,
                source  => 'puppet:///modules/rampconfig/mime.types',
		}
		}

	default: { notice("Welcome stranger") }
 }
}

