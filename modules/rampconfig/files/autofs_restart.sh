#!/bin/bash
#
# Script to address hanging NFS mount issues on worker servers
#
#
# STOP java process before autofs restart
 echo "STOP java process"
 /bin/kill -STOP `ps auxww|grep java | grep -v com.everyzing.ramp.agent | awk '{print $2}'`

# sleep
 sleep 10

# restart 'autofs' service
 echo "Restart autofs"
 /etc/init.d/autofs restart

# sleep
 sleep 15

# CONT java process 
 echo "CONT java process"
 /bin/kill -CONT `ps auxww|grep java | grep -v com.everyzing.ramp.agent | awk '{print $2}'`
