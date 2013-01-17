class rampconfig::users {

user { 'nagios':
  ensure           => 'present',
  home             => '/var/log/nagios',
  password         => '!!',
  password_max_age => '-1',
  password_min_age => '-1',
#  shell            => '/bin/bash',
}

user { 'puppet':
  ensure           => 'present',
  comment          => 'Puppet',
  home             => '/var/lib/puppet',
  password         => '!!',
  password_max_age => '-1',
  password_min_age => '-1',
  shell            => '/sbin/nologin',
}

}
