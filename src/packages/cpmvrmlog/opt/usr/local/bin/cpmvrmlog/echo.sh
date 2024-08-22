#!/bin/sh
##-----------------------------------------------------------------------------
## cpmvrmlog/echo.sh - optput to syslog or console
#
## Creation:     23.05.2004  lanspezi
## Last Update:  $Id: echo.sh 51847 2018-03-06 14:55:07Z kristov $
##
##-----------------------------------------------------------------------------

if [ "$1" != "" -a "$2" != "" ]
then
  if [ -f /usr/bin/logger -o -L /usr/bin/logger ]
  then
    logger -t "$1" "$2"
  else
    echo "$1: $2" > /dev/console 2>&1
  fi
fi

set +x
