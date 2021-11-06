# sneaky
A tiny little bash script for personal use to automatically take screenshots repeatedly. 

**Requirements**:

To run, `sneaky.sh` needs for [gnome-screenshot](https://github.com/GNOME/gnome-screenshot) to be installed. This can be done as follows,

Arch Linux based distros: `sudo pacman -Sy gnome-screenshot`.

Ubuntu: `sudo apt-get install gnome-screenshot`.
  
By default, 

* initial sleep time in seconds = 90
* number of screenshots = 100
* delay between shots in seconds = 60

**How to run**:

1. Download `sneaky.sh` or clone this repository. 
2. Open your terminal and run `$ chmod +x /path/to/sneaky.sh` to make it executable.
3. Run `$ ./sneaky.sh` to use default values

**Optional arguments**

| short | long | type|
| ----- | ---- | --- |
| -s | --initial-sleep-seconds | integer |
| -n | --number-of-shots | integer |
| -d | --delay-between-shots | integer |
| -w | --active-window-only | boolean flag |

**Examples**
To take 10 screenshots (one per minute) of the active window after waiting 90 seconds run:

```./sneaky.sh -n 10 -w```

To take 10 screenshots (one every 30 seconds) after waiting two minutes run:

```.sneaky.sh -n 10 -d 30 -s 120```

Note that if there is no `-w` flag and there are multiple screens, the screenshot will include
all screens.

