### Setup gnome profile

#### Exporting
dconf dump /org/gnome/terminal/legacy/profiles:/ > gnome-terminal-profiles.dconf

#### Importing
dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf
