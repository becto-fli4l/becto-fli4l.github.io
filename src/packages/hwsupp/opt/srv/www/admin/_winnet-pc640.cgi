#!/bin/sh
# $Id: _winnet-pc640.cgi 51847 2018-03-06 14:55:07Z kristov $
# Do not edit! This file is automaticly generated by rrd-cgi.xsl

. /srv/www/include/cgi-helper
# set_debug=yes

# Security
check_rights "hwsupp" "view"

# get some internal variables
. /var/run/hwsupp.conf

show_html_header "WinNet PC640"

if [ -e /srv/www/include/rrd-common.inc ]
then
    . /srv/www/include/rrd-common.inc
    if [ -e /srv/www/include/rrd-winnet-pc640.inc ]
    then
     . /srv/www/include/rrd-winnet-pc640.inc
    fi
fi
if [ -e /srv/www/include/hwmon-winnet-pc640.inc ]
then
    . /srv/www/include/hwmon-winnet-pc640.inc
fi
if [ -e /srv/www/include/extra-dmidecode.inc ]
then
    . /srv/www/include/extra-dmidecode.inc
fi

: ${FORM_action:=winnet_pc640_temp}
if [ -e /srv/www/include/rrd-common.inc ]
then
    : ${FORM_rrd_graphtime_winnet_pc640_temp:=$rrd_default_graphtime}
    : ${FORM_rrd_graphtime_winnet_pc640_voltage:=$rrd_default_graphtime}

    eval local rrd_source_time='$FORM_rrd_graphtime_'$rrd_source
    : ${rrd_source_time:=$rrd_default_graphtime}
fi
action_list=""
if [ -e /srv/www/include/rrd-common.inc ]
then
    action_list="$action_list temp voltage"
fi
action_list="$action_list hwmon"
action_list="$action_list bios"

tab_list=""
for i in ${action_list}
do
    case $i in
        temp)
            label=$(translate_label "${_HWSUPP_TEMP}")
        ;;
        voltage)
            label=$(translate_label "${_HWSUPP_VOLTAGE}")
        ;;
        hwmon)
            label=$(translate_label "${_HWSUPP_HWMON}")
        ;;
        bios)
            label=$(translate_label "${_HWSUPP_DMI}")
        ;;
    esac
    if [ "$FORM_action" = "winnet_pc640_$i" ]
    then
        tab_list=`echo "$tab_list $label no"`
    else
        tab_list=`echo "$tab_list $label $myname?action=winnet_pc640_$i"`
    fi
done

show_tab_header $tab_list
case $FORM_action in
    winnet_pc640_hwmon)
        hwmon_winnet_pc640
    ;;
    winnet_pc640_bios)
        extra_dmidecode
    ;;
    *)
        rrd_open_tab_list $FORM_action
        rrd_render_graph $FORM_action
        rrd_close_tab_list
    ;;
esac

show_tab_footer

show_html_footer

# _oOo_
