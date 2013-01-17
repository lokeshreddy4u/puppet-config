class rampconfig::resolv {
      case $hostname {
        pod-file-01: { include resolve::off }
	/^fast.*/: { include resolve::fast }
	/^FAST.*/: { include resolve::fast }
	default: { include resolve::navi }
	}
      }

class resolve::off {
	 file { '/etc/resolv.conf':
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0644,
                source  => 'puppet:///modules/rampconfig/etc/resolv.conf.off',
        }
}

class resolve::fast {
         file { '/etc/resolv.conf':
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0644,
                source  => 'puppet:///modules/rampconfig/etc/resolv.conf.fast',
        }
}

class resolve::navi {
 file { '/etc/resolv.conf':
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0644,
                source  => 'puppet:///modules/rampconfig/etc/resolv.conf.navi',
}
}

