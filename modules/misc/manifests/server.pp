class misc::server
{

  case $hostname {
        /^colo-dev-0.*/: {


	file { "/home/tomcat/conf/server.${hostname}.xml":
    		ensure => "present",
		owner  => "zinger",
                group  => "zinger",
		mode   => 750,
    		source => "puppet:///modules/misc/server.${hostname}.xml",
	}

	file { "/home/tomcat/conf/server.xml":
   		ensure => "link",
		owner  => "zinger",
    		group  => "zinger",
   		target => "/home/tomcat/conf/server.${hostname}.xml",
	}

	file { "/etc/httpd/conf.d/developer_sites.${hostname}.conf":
                ensure => "present",
                owner  => "root",
                group  => "root",
                mode   => 644,
                source => "puppet:///modules/misc/developer_sites.${hostname}.conf",
        }

	 file { "/etc/httpd/conf.d/developer_sites.conf":
                ensure => "link",
                owner  => "root",
                group  => "root",
                target => "/etc/httpd/conf.d/developer_sites.${hostname}.conf",
        }

	}

  default: { notice("Welcome stranger") }

	}
}
