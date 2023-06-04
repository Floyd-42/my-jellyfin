#!/bin/bash

# Ce script doit être executé sur la machine host pour créer l'arborescence suivante :

# /volume1/data
# ├── torrents
# │   ├── books
# │   ├── movies
# │   ├── music
# │   └── tv
# ├── usenet
# │   ├── incomplete
# │   └── complete
# │        ├── books
# │        ├── movies
# │        ├── music
# │        └── tv
# └── media
#     ├── books
#     ├── movies
#     ├── music
#     └── tv


# Root directory
root_dir="/volume1/data"

# Subdirectories
sub_dirs=("torrents" "usenet/incomplete" "usenet/complete" "media")
media_types=("books" "movies" "music" "tv")

# Create root directory
mkdir -p $root_dir

# Create subdirectories for torrents, usenet/complete and media
for dir in "${sub_dirs[@]}"
do
  if [[ $dir != "usenet/incomplete" ]]; then
    for media_type in "${media_types[@]}"
    do
      mkdir -p "$root_dir/$dir/$media_type"
    done
  else
    mkdir -p "$root_dir/$dir"
  fi
done


mkdir -p /volume1/docker/appdata/{radarr,sonarr,bazarr,plex,pullio,qbittorrent}
