class puppet::mcollective::configuration {

 case $operatingsystemrelease {
        /^5.*/, /^6.*/: { include  puppet::mcollective::configuration::5 }
	default: { include puppet::mcollective::configuration::4 }
 }

class puppet::mcollective::configuration::5
{
 package {
        "puppet": ensure => present;
        "facter": ensure => present;
        "mcollective": ensure => present;
        "mcollective-common": ensure => present;
        "mcollective-client": ensure => present;
        }

 file { "/usr/libexec/mcollective/mcollective/application":
        mode    => "755",
        owner   => puppet,
        group   => puppet,
        source  => "puppet:///modules/puppet/application",
        recurse => true,
        }

 file { "/usr/libexec/mcollective/mcollective/agent":
        mode    => "755",
        owner   => puppet,
        group   => puppet,
        source  => "puppet:///modules/puppet/agent",
        recurse => true,
        }

 file { "/usr/libexec/mcollective/mcollective/facts":
        mode    => "755",
        owner   => puppet,
        group   => puppet,
        source  => "puppet:///modules/puppet/facts",
        recurse => true,
        }

 file { "/usr/libexec/mcollective/mcollective/connector":
        mode    => "755",
        owner   => puppet,
        group   => puppet,
        source  => "puppet:///modules/puppet/connector",
        recurse => true,
        }

 file { "/usr/libexec/mcollective/mcollective/aggregate":
        mode    => "755",
        owner   => puppet,
        group   => puppet,
        source  => "puppet:///modules/puppet/aggregate",
        recurse => true,
        }

 file { "/usr/libexec/mcollective/mcollective/discovery":
        mode    => "755",
        owner   => puppet,
        group   => puppet,
        source  => "puppet:///modules/puppet/discovery",
        recurse => true,
        }


 file { "/usr/libexec/mcollective/mcollective/spec":
        mode    => "755",
        owner   => puppet,
        group   => puppet,
        source  => "puppet:///modules/puppet/spec",
        recurse => true,
        }

 file { "/usr/sbin":
        source  => "puppet:///modules/puppet/sbin",
        recurse => true,
        }

 file { "/usr/libexec/mcollective/mcollective/check_mcollective.rb":
        mode    => "755",
        owner   => puppet,
        group   => puppet,
        source  => "puppet:///modules/puppet/check_mcollective.rb",
        }

 file { "/usr/libexec/mcollective/mcollective/registration.rb":
        mode    => "755",
        owner   => puppet,
        group   => puppet,
        source  => "puppet:///modules/puppet/registration.rb",
        }

 service
        {
        "mcollective":  ensure  => running;
        "puppet": ensure  => running;
        }
server{ puppet: hname => $fqdn }
client{ puppet: hname => $fqdn }
}

class puppet::mcollective::configuration::4
{
 package {
        "pe-puppet": ensure => present;
        "pe-facter": ensure => present;
        "pe-mcollective": ensure => present;
        "pe-mcollective-common": ensure => present;
        "pe-mcollective-client": ensure => present;
        }

 service
        {
        "pe-mcollective":  ensure  => running;
        "pe-puppet": ensure  => running;
        }
server{ puppet: hname => $fqdn }
client{ puppet: hname => $fqdn }
}
}

define server($hname)
{

 file
        { "/etc/mcollective/server.cfg":
                path    => "/etc/mcollective/server.cfg",
                owner   => puppet,
                group   => puppet,
                mode    => 0644,
                content => template("puppet/server.erb"),
        }
}

define client($hname)
{
 file
        { "/etc/mcollective/client.cfg":
                path    => "/etc/mcollective/client.cfg",
                owner   => puppet,
                group   => puppet,
                mode    => 0644,
                content => template("puppet/client.erb"),
        }
}

