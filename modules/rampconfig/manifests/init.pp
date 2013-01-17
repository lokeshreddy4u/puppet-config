#
# The baseconfig module includes all the standard configuration
class rampconfig {
	include rampconfig::resolv
	include rampconfig::auto-mount
	include rampconfig::omsa
	include rampconfig::repo
	include rampconfig::timeserver
	include rampconfig::syslog
}

