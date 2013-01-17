class dell::omsa
{
if ( $manufacturer == "Dell Inc." ) {
            include dell::openmanage
        }
}

class dell::openmanage
{

	$omsaURL = "http://linux.dell.com/repo/hardware/latest/bootstrap.cgi"
	exec { 
	"install-OpenManage":
        command => "wget -q -O - ${omsaURL} | bash", 
        path    => "/bin:/usr/bin:/usr/sbin:/sbin",
        unless  => "test -e /etc/yum.repos.d/dell-omsa-repository.repo",
	    }

	
	package { 'srvadmin-all':
                ensure => installed,
        }

	file { '/etc/init.d/omsa':
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0755,
                source  => 'puppet:///modules/dell/omsa',
        }

	exec { "Start-OMSA":
	command 	=> "/etc/init.d/omsa start",
	path		=> "/bin:/usr/bin:/usr/sbin:/sbin",
	     }

}
}
