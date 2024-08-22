#!/bin/sh
#------------------------------------------------------------------------------
# /usr/bin/pcengines-alix-cron.sh                                  __FLI4LVER__
#
# Creation:     08.02.2015 cspiess
# Last Update:  $Id: pcengines-alix-cron.sh 51847 2018-03-06 14:55:07Z kristov $
#------------------------------------------------------------------------------

#reload lm90 driver
modprobe -r lm90
sleep 2
modprobe lm90
