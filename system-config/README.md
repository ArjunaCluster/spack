# Arjuna Wide Configuration Settings

These files specify the system wide settings for Arjuna (Ie. they are symlinked
into `/etc/spack`).


## Editing

DO NOT EDIT OUTSIDE OF MAINTENANCE WINDOWS

1) Edit the file and confirm changes are correct
2) Commit the changes
3) Run `sudo /opt/ArjunaAdmin/config/warewulf/overlays/update_overlays.py`
   to push changes to worker nodes
