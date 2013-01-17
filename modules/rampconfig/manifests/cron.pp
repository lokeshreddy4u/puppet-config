class rampconfig::cron {

case $operatingsystemrelease {
        /^5.*/, /^6.*/: {

   cron { puppet-daily-restart:
        command => "/etc/init.d/puppet restart &> /dev/null",
        ensure  => present,
        user    => root,
        minute  => 0,
        hour    => 17,
        weekday => [ 1, 2, 3, 4, 5, 6, 7 ],
    }

   cron { mcollective-daily-restart:
        command => "/etc/init.d/mcollective restart &> /dev/null",
        ensure  => present,
        user    => root,
        minute  => 30,
        hour    => 17,
        weekday => [ 1, 2, 3, 4, 5, 6, 7 ],
    }

}

default: { 

   cron { puppet-daily-restart:
        command => "/etc/init.d/pe-puppet restart &> /dev/null",
        ensure  => present,
        user    => root,
        minute  => 30,
        hour    => 7,
        weekday => [ 1, 2, 3, 4, 5, 6, 7 ],
    }

   cron { mcollective-daily-restart:
        command => "/etc/init.d/pe-mcollective restart &> /dev/null",
        ensure  => present,
        user    => root,
        minute  => 30,
        hour    => 7,
        weekday => [ 1, 2, 3, 4, 5, 6, 7 ],
    }


}}}

