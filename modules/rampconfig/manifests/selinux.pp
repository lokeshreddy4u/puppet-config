class rampconfig::selinux {
	file { "/etc/selinux/config":
                source => 'puppet:///modules/rampconfig/selinux.config',
                owner => "root", group => "root", mode => 0644;
            }

	exec { "disable_selinux_enforcement":
                command => "/usr/sbin/setenforce 0",
                unless => "/usr/sbin/getenforce | grep -q 'Disabled'";
            }
}
