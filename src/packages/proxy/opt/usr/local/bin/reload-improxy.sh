#!/bin/sh
#----------------------------------------------------------------------------
# reload-improxy.sh - reloads/restarts improxy                 __FLI4LVER__
#
# Last Update:  $Id: reload-improxy.sh 55659 2019-04-24 11:13:41Z florian $
#----------------------------------------------------------------------------

. /etc/boot.d/base-helper

pidfile=/var/run/improxy.pid

conffile=/etc/improxy.conf

if [ -s $conffile ]
then
   if [ -f $pidfile ] && [ -d /proc/$(cat $pidfile) ]
   then
      logger -t "reload-improxy.sh" "restarting improxy"
      kill -TERM $(cat $pidfile)
   fi
   improxy -c $conffile &
   pidof improxy > $pidfile
else
    if [ -f $pidfile ]
    then
        kill $(cat $pidfile)
    fi
fi
