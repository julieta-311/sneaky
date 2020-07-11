# sneaky
A tiny little bash script for personal use to automatically take screenshots repeatedly. 

`sneaky.sh` will install <a href="https://github.com/GNOME/gnome-screenshot">gnome-screenshot</a> if it's not already installed, then it will wait for an 
`initial sleep time in seconds`, after which it will start taking screenshots every `delay between shots in seconds` 
until it reaches the `number of screenshots` it was requested.
  
By default, 

* initial sleep time in seconds = 90
* number of screenshots = 100
* delay between shots in seconds = 60

<strong>How to run (ubuntu)</strong>:

1. Download `sneaky.sh` or clone this repository. 
2. Open your terminal and run `$ chmod +x /path/to/sneaky.sh` to make it executable.
3. Run `$ ./sneaky.sh` to use default values

<strong>Optional arguments</strong>

| short | long | type|
| ----- | ---- | --- |
| -s | --initial-sleep-seconds | integer |
| -n | --number-of-shots | integer |
| -d | --delay-between-shots | integer |
| -w | --active-window-only | boolean flag |

<strong>Examples</strong>
To take 10 screenshots (one per minute) of the active window after waiting 90 seconds run:

```./sneaky.sh -n 10 -w```

To take 10 screenshots (one every 30 seconds) after waiting two minutes run:

```.sneaky.sh -n 10 -d 30 -s 120```

Note that if there is no `-w` flag and there are multiple screens, the screenshot will include
all screens.
