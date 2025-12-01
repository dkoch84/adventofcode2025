#!/bin/bash
index=50
password=0

while read rotation || [ -n "$rotation" ]; do
  direction=${rotation:0:1}
  clicks=${rotation:1}
  echo "direction: ${direction} clicks: ${clicks}"

  # fancy math
  if [ ${direction} == "L" ]; then
    symbol="-"
  else
    symbol="+"
  fi

  for click in $(seq ${clicks}); do
    let index=index${symbol}1
      if [ $index -eq 100 ]; then
        let index=0
      elif [ $index -eq -1 ]; then
        let index=99
      fi
  done

  if [ $index -eq 0 ]; then
    let password++
  fi
  
  echo $password
done < input