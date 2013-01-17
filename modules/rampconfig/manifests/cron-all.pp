class rampconfig::cron-all {

case $hostname {

	/^FAST.*/: {

	cron { querylogs_purge:
	command => 'find /home/fast/esp/var/log/querylogs/query_log* -mtime +90 -exec rm {} \; &> /dev/null',
	ensure  => present,
        user    => root,
        minute  => 40,
        hour    => 23,
        weekday => [ 1, 2, 3, 4, 5, 6, 7 ],
        }
	}
	
        /^pod-worker.*/: {

   	cron { autofs-daily-restart:
        command => "/etc/init.d/autofs restart &> /dev/null",
        ensure  => absent,
        user    => root,
        minute  => 55,
        hour    => 23,
        weekday => [ 1, 2, 3, 4, 5, 6, 7 ],
    	}

	file { '/root/scripts':
		ensure => directory,
	}

	file { '/root/scripts/autofs_restart.sh':
                ensure  => file,
                owner   => root,
                group   => root,
                mode    => 0644,
                source  => 'puppet:///modules/rampconfig/autofs_restart.sh',
        }

        cron { autofs-restart:
        command => "/root/scripts/autofs_restart.sh > /var/tmp/autofs_restart.txt",
        ensure  => present,
        user    => root,
        minute  => 55,
        hour    => 23,
        weekday => [ 1, 2, 3, 4, 5, 6, 7 ],
    	}

	}

	reporting: {

	cron { reporting-db-backup:
	command => "/bin/sh /net/san/nfs0/home/zinger/db_backup_metaqapi.sh metaqapi &> /dev/null",
	ensure  => present,
        user    => zinger,
        minute  => 15,
        hour    => 0,
    	}
	
	cron { mysql-binary-logs:
        command => "mysql -u root -paibuild -e 'PURGE BINARY LOGS BEFORE DATE_SUB( NOW( ), INTERVAL 7 DAY);' &> /dev/null",
        ensure  => present,
        user    => root,
        minute  => 55,
        hour    => 01,
        weekday => [ 1, 2, 3, 4, 5, 6, 7 ],
    	}

	}

	/^colo-db.*/: {

	cron { mysql-binary-logs:
	command => "mysql -u root -paibuild -e 'PURGE BINARY LOGS BEFORE DATE_SUB( NOW( ), INTERVAL 7 DAY);' &> /dev/null",
	ensure  => present,
        user    => root,
        minute  => 55,
	hour	=> 01,
	weekday => [ 1, 2, 3, 4, 5, 6, 7 ],
    	}
	}

	loghost: {
	cron { schdule-service-downtime:
	command	=> "/usr/local/nagios/bin/prd_downtime.sh &> /dev/null",
	ensure  => present,
        user    => root,
        minute  => 00,
        hour    => 01,
        weekday => [ 1, 2, 3, 4, 5, 6, 7 ],
        }

        }


	default: { notice("Welcome stranger") }
}
}
