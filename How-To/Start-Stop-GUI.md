# Status DE
    sudo systemctl get-default

Output if GUI is activated:

> graphical.target

or if GUI isn't activated:

> multi-user.target

# Stop DE

### Enable CLI service
    sudo systemctl enable multi-user.target

### Set CLI as default
    sudo systemctl set-default multi-user.target

Output:
> Created symlink from /etc/systemd/system/default.target to /lib/systemd/system/multi-user.target.

### Restart
    sudo reboot

# Start DE

### Enable GUI service
    sudo systemctl set-default graphical.target

### Restart
    sudo reboot

# CLI auto log-in
Automatic login to console (CLI) on boot without GUI:

    sudo systemctl edit getty@tty1

Change `ExecStart`:

```
[Service] 
ExecStart=-/sbin/agetty -a <username> --noclear %I $TERM
```
`<username>` - CLI login user name without angle brackets (bra-ket).
