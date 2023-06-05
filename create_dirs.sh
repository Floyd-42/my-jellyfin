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
root_dir="/volume1"
root_dir="/home/floyd/projects/my-jellyfin/volume1"

# Data directory
data_dir="$root_dir/data"

# Docker directory
docker_dir="$root_dir/docker"

# Subdirectories
sub_dirs=("torrents" "usenet/incomplete" "usenet/complete" "media")
media_types=("books" "movies" "music" "tv")

# Create root directory
mkdir -p $data_dir

# Create subdirectories for torrents, usenet/complete and media
for dir in "${sub_dirs[@]}"
do
  if [[ $dir != "usenet/incomplete" ]]; then
    for media_type in "${media_types[@]}"
    do
      mkdir -p "$data_dir/$dir/$media_type"
    done
  else
    mkdir -p "$data_dir/$dir"
  fi
done



# https://github.com/TRaSH-/Guides-Synology-Templates/blob/main/templates/jellyfin.yml
mkdir -p $docker_dir/appdata/{radarr,sonarr,bazarr,jellyfin,jellyfin_cache,pullio,qbittorrent}
