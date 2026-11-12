#!/bin/bash
STATE=$(/usr/bin/pmset -g | awk '/SleepDisabled/{print $2}')

if [ "$STATE" = "1" ]; then
  echo "☕️ | color=orange"
  echo "---"
  echo "Estado: DESPIERTO con la tapa cerrada | color=orange"
  echo "Cambiar a: dormir normal | bash=/usr/bin/sudo param1=pmset param2=-a param3=disablesleep param4=0 terminal=false refresh=true"
else
  echo "💤"
  echo "---"
  echo "Estado: se duerme al cerrar la tapa | color=gray"
  echo "Cambiar a: seguir despierto | bash=/usr/bin/sudo param1=pmset param2=-a param3=disablesleep param4=1 terminal=false refresh=true"
fi
echo "---"
echo "Refrescar | refresh=true"
