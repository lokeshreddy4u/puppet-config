# nodes.pp
#
# Note :  
#
# 
node basenode 
{
	include rampconfig::resolv
	include rampconfig::auto-mount
#	include dell::omsa # install & configure open Manage
	include dell::snmp # Enable snmp 
	include puppet::bbc  # Remove big brother from all servers
#	include dell::drivers # Update Dell firmware repo
	include rampconfig::repo
	include rampconfig::timeserver
	include rampconfig::smtp
	include motd
	include rampconfig::root_user
	include rampconfig::pe-puppet
	include rampconfig::tomcatlogs # Tomcat log rotate
	include rampconfig::ssh-auth
	include rampconfig::cron
	include rampconfig::files
	include rampconfig::selinux
	include rampconfig::packages
	include rampconfig::filelimit
#	include rampconfig::ldapconfig
	include rampconfig::sudo
	include apache::http-config
	include apache::php-config
	include rampconfig::cron-all
	include monitor::eventhandler
	include monitor::plugins
	include monitor::services
}

node puppet  inherits basenode
{
	include rampconfig::syslog
	include rampconfig::logrotate
}

node loghost2 inherits basenode
{
	include puppet::mcollective::configuration
	include rampconfig::tomcatlogs
	include rampconfig::users
	include monitor::services

}

node loghost inherits basenode
{
        include puppet::mcollective::configuration
        include rampconfig::tomcatlogs

}

node mail inherits basenode
{
        include puppet::mcollective::configuration
        include rampconfig::syslog
        include rampconfig::logrotate
        include rampconfig::users
}

node /^colo-utils.*/ inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::users
}

node /^office-utils.*/ inherits basenode
{
        include puppet::mcollective::configuration
        include rampconfig::syslog
        include rampconfig::logrotate
        include rampconfig::users
}

node urchin inherits basenode
{
	include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::users
}

node reporting  inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::users
}

node colo-build-01  inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::users
}

node monitor inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
}

node wiki  inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::users
}

node /^fast-hearst.*/ inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::hosts
	include rampconfig::syslog
	include rampconfig::logrotate
}

node /^fasta-admin.*/ inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::hosts
	include rampconfig::syslog
	include rampconfig::logrotate
}

node /^fasta-search.*/ inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::hosts
	include rampconfig::syslog
	include rampconfig::logrotate
}

node /^fastb-admin.*/ inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::hosts
	include rampconfig::syslog
	include rampconfig::logrotate
}

node /^fastb-search.*/ inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::hosts
	include rampconfig::syslog
	include rampconfig::logrotate
}

node /^fastc-search.*/ inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::hosts
	include rampconfig::syslog
	include rampconfig::logrotate
}

node /^fastd-search.*/ inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::hosts
	include rampconfig::syslog
	include rampconfig::logrotate
}

node /^faste-search.*/ inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::hosts
	include rampconfig::syslog
	include rampconfig::logrotate
}

node /^fastf-search.*/ inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::hosts
	include rampconfig::syslog
	include rampconfig::logrotate
}

node /^fastg-search.*/ inherits basenode
{
        include puppet::mcollective::configuration
        include rampconfig::hosts
        include rampconfig::syslog
        include rampconfig::logrotate
}

node /^fasth-search.*/ inherits basenode
{
        include puppet::mcollective::configuration
        include rampconfig::hosts
        include rampconfig::syslog
        include rampconfig::logrotate
}

node /^fasti-search.*/ inherits basenode
{
        include puppet::mcollective::configuration
        include rampconfig::hosts
        include rampconfig::syslog
        include rampconfig::logrotate
}

node /^fastj-search.*/ inherits basenode
{
        include puppet::mcollective::configuration
        include rampconfig::hosts
        include rampconfig::syslog
        include rampconfig::logrotate
}

node pod-file-01 inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::users
}

node /^colo-ac.*/  inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::users
}

node /^colo-db.*/  inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::users
}

node /^pod-worker.*/ inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::hosts
	include rampconfig::users
}

node  /^colo-script.*/ inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::users
}

node /^prod-app.*/  inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::users
}

node /^colo-mcloud-*/  inherits basenode
{
        include puppet::mcollective::configuration
        include rampconfig::syslog
        include rampconfig::logrotate
        include rampconfig::users
}

node /^ramp-app.*/ inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::users
}

node /^stg-.*/  inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::users
}

node /^qa.*/ inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::users
}

node /^colo-file.*/ inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::users
}

node /^colo-media.*/ inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::users
}

node zingindex inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::users
}

node /^pod-d.*/  inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::users
}

node /^delta.*/  inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::users
}

node /^dev-.*/  inherits basenode
{
        include puppet::mcollective::configuration
	include rampconfig::syslog
	include rampconfig::logrotate
	include rampconfig::users
}

node capture-05 inherits basenode
{
        include puppet::mcollective::configuration
        include rampconfig::syslog
        include rampconfig::logrotate
	include rampconfig::users
}

node colo-dev-02 inherits basenode
{
        include puppet::mcollective::configuration
        include rampconfig::syslog
        include rampconfig::logrotate
        include rampconfig::users
}

