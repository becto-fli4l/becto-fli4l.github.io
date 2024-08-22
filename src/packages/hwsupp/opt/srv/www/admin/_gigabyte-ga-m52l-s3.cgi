#!/bin/sh
# $Id: _gigabyte-ga-m52l-s3.cgi 51847 2018-03-06 14:55:07Z kristov $
# Do not edit! This file is automaticly generated by rrd-cgi.xsl

. /srv/www/include/cgi-helper
# set_debug=yes

# Security
check_rights "hwsupp" "view"

# get some internal variables
. /var/run/hwsupp.conf

show_html_header "GigaByte GA-M52L-S3"

if [ -e /srv/www/include/hwmon-gigabyte-ga-m52l-s3.inc ]
then
    . /srv/www/include/hwmon-gigabyte-ga-m52l-s3.inc
fi
if [ -e /srv/www/include/extra-dmidecode.inc ]
then
    . /srv/www/include/extra-dmidecode.inc
fi

: ${FORM_action:=gigabyte_ga_m52l_s3_hwmon}
action_list=""
action_list="$action_list hwmon"
action_list="$action_list bios"

tab_list=""
for i in ${action_list}
do
    case $i in
        hwmon)
            label=$(translate_label "${_HWSUPP_HWMON}")
        ;;
        bios)
            label=$(translate_label "${_HWSUPP_DMI}")
        ;;
    esac
    if [ "$FORM_action" = "gigabyte_ga_m52l_s3_$i" ]
    then
        tab_list=`echo "$tab_list $label no"`
    else
        tab_list=`echo "$tab_list $label $myname?action=gigabyte_ga_m52l_s3_$i"`
    fi
done

show_tab_header $tab_list
case $FORM_action in
    gigabyte_ga_m52l_s3_hwmon)
        hwmon_gigabyte_ga_m52l_s3
    ;;
    gigabyte_ga_m52l_s3_bios)
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
