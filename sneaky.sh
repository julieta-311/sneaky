#!/bin/bash

zzz="$1"
n_shots="$2"
time_between_shots="$3"
printf "\n**** Welcome sneaky little one! ****\n\n"

if [ -z "$3" ]; then
  printf "Using default values. To set your own cancel and run the following instead\n\n"
  echo "*** ./sneaky.sh initial_sleep_in_seconds n_shots time_between_shots_in_seconds ***"
  zzz="90"
  n_shots="100"
  time_between_shots="60"
fi

printf "Initial sleep time set to %d seconds,\n" "$zzz"
printf "Taking %d screenshots" "$n_shots"
printf "Time between shots set to %d.\n\n" "$time_between_shots"
printf "Let's go!\n\n"
printf "Sleeping for %d seconds..." "$zzz"
sleep $zzz

for i in $(seq $n_shots); do 
  printf "Sleeping for %d seconds... \nTaking shot number %d of %d after my nap\n\n" \
   "$time_between_shots" "$i" "$n_shots" 
  gnome-screenshot -w -d "$time_between_shots"
done
