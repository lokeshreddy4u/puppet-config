class puppet::bbc  {
        
	exec { "stop-bbc":
                command => "/etc/init.d/bbc stop",
                onlyif  => "/usr/bin/test -d /etc/init.d/bbc"
	}

	exec { "remove-bbc":
                command => "/bin/rm -Rf /etc/init.d/bbc",
                onlyif  => "/usr/bin/test -d /etc/init.d/bbc"
        }

	exec { "kill-bbc":
                command => "/bin/rm -Rf /usr/local/bbc",
                onlyif  => "/usr/bin/test -d /usr/local/bbc"
        }
}
