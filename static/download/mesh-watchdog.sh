#!/bin/sh
# mesh-watchdog v1.1.1, NYC Mesh, Brian Hall

restartWifi()
{
  wifi down
  sleep 5
  wifi up
}

restartNetwork()
{
  /etc/init.d/network restart
  if /etc/init.d/gwck enabled; then
    /etc/init.d/gwck restart
  fi
  /etc/init.d/bmx6 restart
  sleep 4
  killall dnsmasq
  /etc/init.d/dnsmasq start
}

#gets date-time from log and exit if recently run. date-time is first two words of last line 
exitIfRecentRestart()
{
if [ -e $LOG ]; then
  set -- `tail -1 $LOG`
  LASTRUN=`date --date="$1 $2" +%s`
  if [ "$?" = "0" ]; then
    #don't run for 1200s (20 minutes)
    NEXTRUN=$(($LASTRUN + 1200))
    NOW=`date +%s`
    es=$(($NOW - $LASTRUN))
    printf "time since last restartNetwork: "
    printf '%dd %dh:%dm:%ds\n' $(($es/86400)) $(($es%86400/3600)) $(($es%3600/60)) $(($es%60))
    if [ $NOW -lt $NEXTRUN ]; then
      echo "waiting $(($NEXTRUN - $NOW)) seconds, use option -f to force"
      exit 1
    else
      echo "run tests-"
    fi
  else
    echo "invalid date from log, run tests-"
  fi
else
 echo "no log, run tests-"
fi
}

LOG="/tmp/log/mesh-watchdog.log"
FORCE=0

if [ "$1" = "-n" ]; then       
  echo "restartNetwork"         
  restartNetwork                                                                                                                             
  exit 1
elif [ "$1" = "-f" ]; then     
  echo "force tests-"
  FORCE=1  
elif [ "$1" = "-w" ]; then
  echo "restartWifi"
  restartWifi
  exit 1
elif [ "$1" = "-b" ]; then
  echo "restart wifi, wait, restart network"
  restartWifi; wait 60; restartNetwork
  exit 1
elif [ "$1" != "" ]; then
  echo -e "Usage: `basename $0` [OPTION]\n\nTests wifi and internet connections and restarts if necessary (default)\n\n\t-f\tforce test\n\t-n\trestart network\n\t-w\trestart wifi\n\t-b\trestart both wifi and network\n\t-h\toptions\n" 
  exit 1
fi

if [ $FORCE != 1 ]; then
  exitIfRecentRestart
fi

DATE=`date +%Y-%m-%d\ %H:%M:%S`  
IWINFO=`iwinfo`

# find lines containing "ESSID"|get name (previous word)|replace return with ","
WI=`echo "$IWINFO" | grep ESSID | grep -Eo '^[^ ]+' | sed ':a;N;$!ba;s/\n/, /g`
# count the number of wlan interfaces, and number of wlans with 'no signal'
WLAN=`echo "$WI" | wc -w`
NOSIGNAL=`echo "$IWINFO" | grep 'Signal: unknown' | wc -l`

if [ $WLAN -eq 0 ]; then
  echo "no wlan interfaces, wifi is probably disabled"
elif [ $WLAN -eq $NOSIGNAL ]; then
  # all wlan interfaces are down, so restart wifi   
  echo "$DATE restart wifi- wlans:$WLAN no-signal:$NOSIGNAL interfaces:$WI" | tee -a $LOG
  restartWifi
  sleep 60
  restartNetwork
  exit 1
else
  echo "wifi:ok	wlans:$WLAN	no-signal:$NOSIGNAL	interfaces:$WI"
fi

# restart network if ping google.com && 8.8.8.8 fails 4 times
count=1
while [ "$count" -le 4 ]
 do
   if /bin/ping -c 1 google.com >/dev/null && /bin/ping -c 1 8.8.8.8 >/dev/null; then
      echo "wan:ok	ping-count:$count"
      exit 0
   fi
 let count++
done
echo "$DATE network restart" | tee -a $LOG
restartNetwork
