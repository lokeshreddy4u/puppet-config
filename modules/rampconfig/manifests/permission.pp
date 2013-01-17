class rampconfig::permission {

	file { "/etc/profile":
  	owner => root,
  	group => root,
  	mode  => 755
	}
}
