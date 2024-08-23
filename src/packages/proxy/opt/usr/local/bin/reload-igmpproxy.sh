#!/bin/sh
#----------------------------------------------------------------------------
# reload-igmpproxy.sh - reloads/restarts igmpproxy               __FLI4LVER__
#
# Last Update:  $Id: reload-igmpproxy.sh 53771 2018-09-11 09:13:09Z kristov $
#----------------------------------------------------------------------------

. /etc/boot.d/base-helper

pidfile=/var/run/igmpproxy.pid

conffile=/etc/igmpproxy.conf

if [ -s $conffile ]
then
   if [ -f $pidfile ] && [ -d /proc/$(cat $pidfile) ]
   then
      logger -t "reload-igmpproxy.sh" "restarting igmpproxy"
      kill -TERM $(cat $pidfile)
   fi
   igmpproxy $conffile
   pidof igmpproxy > $pidfile
else
    if [ -f $pidfile ]
    then
        kill $(cat $pidfile)
    fi
fi
