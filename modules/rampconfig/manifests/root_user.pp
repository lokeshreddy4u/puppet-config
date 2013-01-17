# = Class: site::root_user
#   This is a simple class to manage the root user password.
#   The shadow hash of an existing password can be easily obtained
#   by running `puppet resource user root` on a Linux system
#   that has the desired root password already set.
#   Puppet will then manage this password everywhere.
#
#   First, I set the password to "puppet" on one Linux node and then get back the
#   shadow hash.
#
# Refer below example to generate hash password
#
#[root@loghost2 mail]# passwd
#Changing password for user root.
#New password:
#Retype new password:
#passwd: all authentication tokens updated successfully.
#[root@loghost2 mail]# puppet resource user root
#user { 'root':
#  ensure           => 'present',
#  comment          => 'root',
#  gid              => '0',
#  groups           => ['root', 'bin', 'daemon', 'sys', 'adm', 'disk', 'wheel', 'zinger', 'nasman'],
#  home             => '/root',
#  password         => '$1$jiP6I.dw$vRKc.UTnyKBhXy1wGIH3r/',
#  password_max_age => '99999',
#  password_min_age => '0',
#  shell            => '/bin/bash',
#  uid              => '0',
#}
#

class rampconfig::root_user { 
     user { root: 
           ensure 	=> present, 
	   uid		=> '0',
	   gid		=> '0',
	   home		=> '/root',
           password 	=> '$1$uR//6DjG$d3yijEfSm6/oGHw6QPBS70', 
}
}
