#!/bin/bash

initial_sleep_seconds="$1"
n_shots="$2"
seconds_between_shots="$3"
printf "\n**** Welcome sneaky little one! ****\n\n"

if [ -z "$3" ]; then
  printf "Using default values. To set your own cancel and run the following instead\n\n"
  echo "*** ./sneaky.sh initial_sleep_in_seconds n_shots time_between_shots_in_seconds ***"
  initial_sleep_seconds="90"
  n_shots="100"
  seconds_between_shots="60"
fi

printf "Initial sleep time set to %d seconds,\n" "$initial_sleep_seconds"
printf "taking %d screenshots,\n" "$n_shots"
printf "time between shots set to %d.\n\n" "$seconds_between_shots"
printf "Let's go!\n\n"
printf "Sleeping for %d seconds..." "$initial_sleep_seconds"
sleep "$initial_sleep_seconds"

for i in $(seq $n_shots); do 
  printf "Sleeping for %d seconds... \nTaking shot number %d of %d after my nap\n\n" \
   "$seconds_between_shots" "$i" "$n_shots" 
  gnome-screenshot -w -d "$seconds_between_shots"
done
