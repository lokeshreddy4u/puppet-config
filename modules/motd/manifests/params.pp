class motd::params {
  case $::operatingsystem {
    CentOS,RedHat,Scientific: {
      $config_file = '/etc/motd'
      $template = 'motd/motd.erb'
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }
}
