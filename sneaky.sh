#!/bin/bash

params=""

initial_sleep_seconds=90
n_shots=100
seconds_between_shots=60
active_window_only=0

while (( "$#" )); do
  case $1 in
    -s | --initial-sleep-seconds)
      if [ -n "$2" ] && [ "${2:0:1}" != "-" ] && [[ $2 =~ ^-?[0-9]+$ ]]; then
        initial_sleep_seconds="$2"
        shift
      else
        echo "Error: Argument for $1 is missing or invalid" >&2
        exit 1
      fi
      ;;
    -w | --active-window-only)
      active_window_only=1
      shift
      ;;
    -n | --number-of-shots)
      if [ -n "$2" ] && [ "${2:0:1}" != "-" ] && [[ $2 =~ ^-?[0-9]+$ ]]; then
        n_shots="$2"
        shift
      else
        echo "Error: Argument for $1 is missing or invalid" >&2
        exit 1
      fi
      ;;
    -d | --delay-between-shots)
      if [ -n "$2" ] && [ "${2:0:1}" != "-" ] && [[ $2 =~ ^-?[0-9]+$ ]]; then
        seconds_between_shots="$2"
        shift
      else
        echo "Error: Argument for $1 is missing or invalid" >&2
        exit 1
      fi
      ;;
    -*=)
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *) 
      params="$params $1"
      shift
      ;;
  esac
done

eval set -- "$params"

if [ "$(dpkg -l | grep gnome-screenshot)" == "" ]; then
  printf "\n\n Installing gnome-screenshot... \n"
  sudo pacman -Sy gnome-screenshot
  printf "Done.\n\n"
fi

printf "**** Welcome sneaky little one! ****\n\n"

printf "Initial sleep time set to %d seconds,\n" "$initial_sleep_seconds"
printf "taking %d screenshots,\n" "$n_shots"
printf "time between shots set to %d." "$seconds_between_shots"
if [ $active_window_only == 1 ]; then
  printf "\nTaking screenshots of the active window only."
fi

printf "\n\nTo change this values use the following options:\n\n"
printf "\t-%s \t--%s \t%s\n" "s" "initial-sleep-seconds" "sets initial time to wait before starting"
printf "\t-%s \t--%s \t%s\n" "n" "number-of-shots" "sets the number of screenshots to take"
printf "\t-%s \t--%s \t%s\n" "d" "delay-between-shots" "sets the time in seconds to wait between screenshots"
printf "\t-%s \t--%s \t%s\n\n" "w" "active-window-only" "this flag sets it to shoot only the active window"
printf "example: to wait a minute, then take 5 screenshots of the active window"
printf "waiting 10 seconds between shots call\n"
printf " ./sneaky.sh -%s -%s 60 -%s 5 -%s 10" "w" "s" "n" "d"  

printf "\n\nStarting...\n\n"
printf "Sleeping for %d seconds..." "$initial_sleep_seconds"
sleep "$initial_sleep_seconds"

for i in $(seq "$n_shots"); do 
  printf "Sleeping for %d seconds... \nTaking shot number %d of %d after my nap\n\n" \
   "$seconds_between_shots" "$i" "$n_shots"
  if [ $active_window_only == 1 ]; then
    gnome-screenshot -w -d "$seconds_between_shots"
  else 
   gnome-screenshot -d "$seconds_between_shots"
  fi
done

printf "Done!\n\n"

