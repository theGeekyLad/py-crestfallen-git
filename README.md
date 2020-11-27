# Crestfallen Git

## Big Idea

Execute a scan on all registered Git projects after a suspend is initiated and before DE shuts down.

## Experiments

- `systemd` provides hooks as units (`.target` files) - sleep, suspend, hibernate etc.
  - `systemd` executes hooks conncurrently and adding a logical sequence is very difficult
  - Sequencing units as cumbersome as finding the units to hook into
- `systemd-inhibit` holds system from sleeping only when a process is in progress - also throws a dialog
  - PyGObject wraps around `systemd-inhibit` for programmatically holding a lock - still doesn't help
- `runuser` works only in Wayland session and not Xorg
- Access to X display / server can be done only if X display and `XAUTHORITY` variables are set
  - `XAUTHORITY` is a security credential that changes at boot - how to fetch this?
    - Create a hidden file at boot (`.bash_profile`) inside current user that spawns X and set `XAUTHORITY`
    - Have `/etc/acpid/handler.sh` read this variable and set `XAUTHORITY` temporarily to run the GTK dialog
- **_Breakthrough_**
  - Hook into ACPI events
  - Most people hit the power button to sleep on docked computers
  - GNOME Shell extension is on the way for replacing system suspend
  - _Why use `runuser`?_

## Further Reading

- https://bbs.archlinux.org/viewtopic.php?id=63706