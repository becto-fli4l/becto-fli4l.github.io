#! /bin/sh
#----------------------------------------------------------------------------
# /usr/local/bin/dhcp-server-circuit-ctrl.sh                     __FLI4LVER__
#
# responsible for dialling and hanging up DHCP server circuits
# delegates to a daemon-specific control script
#
# Last Update:  $Id: dhcp-server-circuit-ctrl.sh 55276 2019-02-23 21:08:12Z kristov $
#----------------------------------------------------------------------------

. /usr/share/circuits/api

script="$(basename $0)[$$]"
facility=$circuit_logfacility
. /usr/share/logfunc.sh

daemon_script=dhcp-server-${circ_dhcp_server_daemon}-circuit-ctrl.sh
if type -p $daemon_script >/dev/null
then
    $daemon_script "$@"
else
    log_error "cannot execute $daemon_script"
fi
