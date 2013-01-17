class rampconfig::auto-mount {
	 file { '/etc/nsswitch.conf':
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0644,
                source  => 'puppet:///modules/rampconfig/etc/nsswitch.conf',
        }
}
