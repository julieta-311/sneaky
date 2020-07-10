#!/bin/bash

initial_sleep_seconds="$1"
n_shots="$2"
seconds_between_shots="$3"
active_window_only="$4"

printf "\n**** Welcome sneaky little one! ****\n\n"

if [ -z "$4" ]; then
  printf "Using default values. To set your own cancel and run the following instead\n\n"
  printf "*** ./sneaky.sh initial_sleep_in_seconds n_shots time_between_shots_in_seconds true ***\n\n"
  printf "or for multiple monitors: \n\n *** ./sneaky.sh initial_sleep_in_seconds n_shots time_between_shots_in_seconds false ***"
  initial_sleep_seconds="90"
  n_shots="100"
  seconds_between_shots="60"
  active_window_only="true"
fi

printf "Initial sleep time set to %d seconds,\n" "$initial_sleep_seconds"
printf "taking %d screenshots,\n" "$n_shots"
printf "time between shots set to %d." "$seconds_between_shots"
if [ $active_window_only == "true" ]; then
  printf "\nTaking screenshots of the active window only."
fi

printf "\n\nLet's go!\n\n"
printf "Sleeping for %d seconds..." "$initial_sleep_seconds"
sleep "$initial_sleep_seconds"

for i in $(seq $n_shots); do 
  printf "Sleeping for %d seconds... \nTaking shot number %d of %d after my nap\n\n" \
   "$seconds_between_shots" "$i" "$n_shots"
  if [ $active_window_only == "true" ]; then
    gnome-screenshot -B -w -d "$seconds_between_shots"
  else 
   gnome-screenshot -B -d "$seconds_between_shots"
  fi
done
