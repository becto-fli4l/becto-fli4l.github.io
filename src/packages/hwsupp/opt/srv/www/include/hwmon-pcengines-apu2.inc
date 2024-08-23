# $Id: hwmon-pcengines-apu2.inc 51847 2018-03-06 14:55:07Z kristov $
# Do not edit! This file is automaticly generated by hwmon-inc.xsl

hwmon_pcengines_apu2_temp ()
{
    var1=`sensors -u k10temp-pci-00c3 | grep temp1_input | cut -d : -f 2`
    var1=`echo ${var1}| sed 's/[^0-9]*\([0-9]*\)\.\([0-9]\{1\}\).*/\1.\2/'`

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
    echo "</table>"

    show_tab_footer
}

hwmon_pcengines_apu2_frequency ()
{
    var1=`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq`
    var1=$((var1 / 1000))
    var2=`cat /sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq`
    var2=$((var2 / 1000))
    var3=`cat /sys/devices/system/cpu/cpu2/cpufreq/cpuinfo_cur_freq`
    var3=$((var3 / 1000))
    var4=`cat /sys/devices/system/cpu/cpu3/cpufreq/cpuinfo_cur_freq`
    var4=$((var4 / 1000))

    show_tab_header ${_HWSUPP_RT_FREQUENCY} no

    echo "<table class='normtable'>"
    echo "<tr>"
    echo "<th>${_HWSUPP_HWMON_SENSOR}</th>"
    echo "<th>${_HWSUPP_RL_FREQUENCY}</th>"
    echo "</tr>"
    echo "<tr align='center'>"
    echo "<td>${_HWSUPP_RC_CPU} 0</td>"
    echo "<td>${var1}</td>"
    echo "</tr>"
    echo "<tr align='center'>"
    echo "<td>${_HWSUPP_RC_CPU} 1</td>"
    echo "<td>${var2}</td>"
    echo "</tr>"
    echo "<tr align='center'>"
    echo "<td>${_HWSUPP_RC_CPU} 2</td>"
    echo "<td>${var3}</td>"
    echo "</tr>"
    echo "<tr align='center'>"
    echo "<td>${_HWSUPP_RC_CPU} 3</td>"
    echo "<td>${var4}</td>"
    echo "</tr>"
    echo "</table>"

    show_tab_footer
}

hwmon_pcengines_apu2 ()
{
    hwmon_pcengines_apu2_temp
    hwmon_pcengines_apu2_frequency
}

# _oOo_