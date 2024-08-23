#! /bin/sh
#----------------------------------------------------------------------------
# /usr/local/bin/ppp-circuit-ctrl.sh                             __FLI4LVER__
#
# responsible for dialling and hanging up PPP circuits
# delegates to a type-specific control script
#
# Last Update:  $Id: ppp-circuit-ctrl.sh 55276 2019-02-23 21:08:12Z kristov $
#----------------------------------------------------------------------------

. /usr/share/circuits/api

script="$(basename $0)[$$]"
facility=$circuit_logfacility
. /usr/share/logfunc.sh

daemon_script=ppp-${circ_ppp_type}-circuit-ctrl.sh
if type -p $daemon_script >/dev/null
then
    $daemon_script "$@"
else
    # use generic pppd script
    pppd-circuit-ctrl.sh "$@"
fi
