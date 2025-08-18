# Brightness Control Script

A really simple brightnessctl wrapper to easily manage your screen brightness through the terminal.

## Instalation
1. **Dependencies**: Ensure  `brightnessctl`is installed.
```bash
   # Debian/Ubuntu
   sudo apt install brightnessctl
   # Arch/Manjaro
   sudo pacman -S brightnessctl
```
2. **Download the script**: Just`download` the script from Github or `clone`the repo.

3. **Modify the script** to use the propper device. You have to manually set the `DEVICE_NAME`variable. To get the name of your screen brightness device you can do one of these commands:
```bash
 ls /sys/class/backlight
```
```bash
brightnessctl -l
```

4. If you want to access it as a normal command put it in somewhere in your path like `/usr/local/bin/<the name you want>`. I've called it `mbright` because there were some problems with just calling it brightness.



## Usage

- `mbright ++`: Increase brightness by 10%

- `mbright --`: Decrease brightness by 10%

- `mbright <digit>`: Set brightness to given percentage `0 <= digit <= 100`!!

> [!CAUTION]
> If you set your brightness to 0 the screen will turn black
