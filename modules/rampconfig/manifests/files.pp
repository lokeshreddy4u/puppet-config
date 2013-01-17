class rampconfig::files
{
file { "/var/log/nagios":
    ensure => "directory",
    owner  => "nagios",
    group  => "nagios",
    mode   => 775,
}

}
