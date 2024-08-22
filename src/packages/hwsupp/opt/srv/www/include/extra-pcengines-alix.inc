# $Id: extra-pcengines-alix.inc 51847 2018-03-06 14:55:07Z kristov $

extra_pcengines_alix  ()
{
    show_tab_header "BIOS" no

    echo "<table class='normtable'>"
    /usr/sbin/pcengines | grep -v Watchdog | sed 's#^#<tr><td>#;s# *: *#</td><td>#;s#$#</td></tr>#;s# #\&nbsp;#g'
    echo "</table>"

    show_tab_footer
}

# _oOo_