class rampconfig::repo {

 case $operatingsystemrelease {
        /^4.*/: { include  rampconfig::repo::4 }
	/^5.*/: { include  rampconfig::repo::5 }	
	/^6.*/: { include  rampconfig::repo::6 }
 }
}

class rampconfig::repo::4 {
	file { "/etc/yum.repos.d/CentOS-Base.repo":
	ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0644,
                source  => 'puppet:///modules/rampconfig/CentOS-Base.repo.4',
        }
}

class rampconfig::repo::5 {
        file { "/etc/yum.repos.d/CentOS-Base.repo":
        ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0644,
                source  => 'puppet:///modules/rampconfig/CentOS-Base.repo.5',
        }
}

class rampconfig::repo::6 {
        file { "/etc/yum.repos.d/CentOS-Base.repo":
        ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0644,
                source  => 'puppet:///modules/rampconfig/CentOS-Base.repo.6',
        }
}



