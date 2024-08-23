# $Id: hwmon-tyan-s5112.inc 51847 2018-03-06 14:55:07Z kristov $
# Do not edit! This file is automaticly generated by hwmon-inc.xsl

hwmon_tyan_s5112_temp ()
{
    var1=`sensors -u adm1027-isa-0000 | grep temp1_input | cut -d : -f 2`
    var1=`echo ${var1}| sed 's/[^0-9]*\([0-9]*\)\.\([0-9]\{1\}\).*/\1.\2/'`
    var2=`sensors -u adm1027-isa-0000 | grep temp2_input | cut -d : -f 2`
    var2=`echo ${var2}| sed 's/[^0-9]*\([0-9]*\)\.\([0-9]\{1\}\).*/\1.\2/'`
    var3=`sensors -u adm1027-isa-0000 | grep temp3_input | cut -d : -f 2`
    var3=`echo ${var3}| sed 's/[^0-9]*\([0-9]*\)\.\([0-9]\{1\}\).*/\1.\2/'`

    show_tab_header ${_HWSUPP_RT_TEMP} no

    echo "<table class='normtable'>"
    echo "<tr>"
    echo "<th>${_HWSUPP_HWMON_SENSOR}</th>"
    echo "<th>${_HWSUPP_RL_TEMP}</th>"
    echo "</tr>"
    echo "<tr align='center'>"
    echo "<td>${_HWSUPP_RC_CPU}</td>"
    echo "<td>${var1}</td>"
    echo "</tr>"
    echo "<tr align='center'>"
    echo "<td>${_HWSUPP_RC_SYS}</td>"
    echo "<td>${var2}</td>"
    echo "</tr>"
    echo "<tr align='center'>"
    echo "<td>VRM</td>"
    echo "<td>${var3}</td>"
    echo "</tr>"
    echo "</table>"

    show_tab_footer
}

hwmon_tyan_s5112_voltage ()
{
    var1=`sensors -u adm1027-isa-0000 | grep in0_input | cut -d : -f 2`
    var1=`echo ${var1}| sed 's/[^0-9]*\([0-9]*\)\.\([0-9]\{3\}\).*/\1.\2/'`
    var2=`sensors -u adm1027-isa-0000 | grep in2_input | cut -d : -f 2`
    var2=`echo ${var2}| sed 's/[^0-9]*\([0-9]*\)\.\([0-9]\{3\}\).*/\1.\2/'`
    var3=`sensors -u adm1027-isa-0000 | grep in3_input | cut -d : -f 2`
    var3=`echo ${var3}| sed 's/[^0-9]*\([0-9]*\)\.\([0-9]\{3\}\).*/\1.\2/'`
    var4=`sensors -u adm1027-isa-0000 | grep in4_input | cut -d : -f 2`
    var4=`echo ${var4}| sed 's/[^0-9]*\([0-9]*\)\.\([0-9]\{3\}\).*/\1.\2/'`

    show_tab_header ${_HWSUPP_RT_VOLTAGE} no

    echo "<table class='normtable'>"
    echo "<tr>"
    echo "<th>${_HWSUPP_HWMON_SENSOR}</th>"
    echo "<th>${_HWSUPP_RL_VOLTAGE}</th>"
    echo "</tr>"
    echo "<tr align='center'>"
    echo "<td>DDR ${_HWSUPP_RC_VCC}</td>"
    echo "<td>${var1}</td>"
    echo "</tr>"
    echo "<tr align='center'>"
    echo "<td>${_HWSUPP_RC_V3SB}</td>"
    echo "<td>${var2}</td>"
    echo "</tr>"
    echo "<tr align='center'>"
    echo "<td>${_HWSUPP_RC_V5}</td>"
    echo "<td>${var3}</td>"
    echo "</tr>"
    echo "<tr align='center'>"
    echo "<td>DDR Vtt</td>"
    echo "<td>${var4}</td>"
    echo "</tr>"
    echo "</table>"

    show_tab_footer
}

hwmon_tyan_s5112_fanspeed ()
{
    var1=`sensors -u adm1027-isa-0000 | grep fan1_input | cut -d : -f 2`
    var1=`echo ${var1}| sed 's/[^0-9]*\([0-9]*\).*/\1/'`
    var2=`sensors -u adm1027-isa-0000 | grep fan2_input | cut -d : -f 2`
    var2=`echo ${var2}| sed 's/[^0-9]*\([0-9]*\).*/\1/'`
    var3=`sensors -u adm1027-isa-0000 | grep fan3_input | cut -d : -f 2`
    var3=`echo ${var3}| sed 's/[^0-9]*\([0-9]*\).*/\1/'`
    var4=`sensors -u w83627hf-isa-0290 | grep fan1_input | cut -d : -f 2`
    var4=`echo ${var4}| sed 's/[^0-9]*\([0-9]*\).*/\1/'`
    var5=`sensors -u w83627hf-isa-0290 | grep fan2_input | cut -d : -f 2`
    var5=`echo ${var5}| sed 's/[^0-9]*\([0-9]*\).*/\1/'`
    var6=`sensors -u adm1027-isa-0000 | grep fan4_input | cut -d : -f 2`
    var6=`echo ${var6}| sed 's/[^0-9]*\([0-9]*\).*/\1/'`
    var7=`sensors -u w83627hf-isa-0290 | grep fan3_input | cut -d : -f 2`
    var7=`echo ${var7}| sed 's/[^0-9]*\([0-9]*\).*/\1/'`

    show_tab_header ${_HWSUPP_RT_FANSPEED} no

    echo "<table class='normtable'>"
    echo "<tr>"
    echo "<th>${_HWSUPP_HWMON_SENSOR}</th>"
    echo "<th>${_HWSUPP_RL_FANSPEED}</th>"
    echo "</tr>"
    echo "<tr align='center'>"
    echo "<td>${_HWSUPP_RC_CPU}</td>"
    echo "<td>${var1}</td>"
    echo "</tr>"
    echo "<tr align='center'>"
    echo "<td>${_HWSUPP_RC_CHASSIS} 2</td>"
    echo "<td>${var2}</td>"
    echo "</tr>"
    echo "<tr align='center'>"
    echo "<td>${_HWSUPP_RC_CHASSIS} 3</td>"
    echo "<td>${var3}</td>"
    echo "</tr>"
    echo "<tr align='center'>"
    echo "<td>${_HWSUPP_RC_CHASSIS} 4</td>"
    echo "<td>${var4}</td>"
    echo "</tr>"
    echo "<tr align='center'>"
    echo "<td>${_HWSUPP_RC_CHASSIS} 5</td>"
    echo "<td>${var5}</td>"
    echo "</tr>"
    echo "<tr align='center'>"
    echo "<td>${_HWSUPP_RC_CHASSIS} 6</td>"
    echo "<td>${var6}</td>"
    echo "</tr>"
    echo "<tr align='center'>"
    echo "<td>${_HWSUPP_RC_CHASSIS} 7</td>"
    echo "<td>${var7}</td>"
    echo "</tr>"
    echo "</table>"

    show_tab_footer
}

hwmon_tyan_s5112 ()
{
    hwmon_tyan_s5112_temp
    hwmon_tyan_s5112_voltage
    hwmon_tyan_s5112_fanspeed
}

# _oOo_