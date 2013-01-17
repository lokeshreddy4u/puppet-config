class rampconfig::services
{
	case $hostname {
	colo-utils-01,colo-utils-02,puppet: { notice("LDAP Server") }
	default: {
		service { "nscd": ensure => "running", }
#		service { "nslcd": ensure => "running", }
}
}
}
