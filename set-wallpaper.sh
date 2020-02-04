#!/usr/bin/env bash

# Strict bash mode.
set -o errtrace
set -o errexit
set -o nounset

wallpaper_dir=/private/var/wallpaper
if [ -L "${wallpaper_dir}/dtta.jpg" ]; then
    echo "Wallpaper already replaced."
    exit 0
fi

mac_picture_name=Mojave\ Day.jpg
mac_picture_path=/Library/Desktop\ Pictures/${mac_picture_name}
if [ ! -f "${mac_picture_path}" ]; then
    echo "Mac picture not found!"
    exit 1
fi

if [ ! -d "${wallpaper_dir}" ]; then
    echo "Wallpaper dir does not exist!"
    exit 1
fi

sudo cp "${mac_picture_path}" ${wallpaper_dir}/
sudo mv ${wallpaper_dir}/dtta.jpg ${wallpaper_dir}/dtta-deloitte.jpg
sudo ln -s "${wallpaper_dir}/${mac_picture_name}" ${wallpaper_dir}/dtta.jpg
killall -KILL Dock
echo "Successfully replaced wallpaper after keeping backup at ${wallpaper_dir}/dtta-deloitte.jpg."
