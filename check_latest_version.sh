#!/bin/bash

download_url="https://terraria.org$(curl -sL https://terraria.org/ | grep -Eo $'[^\'"]+terraria-server-[^\'"]+' | sed $'s/\?.*//')"
version=$(echo "${download_url}" | sed -E 's/.*([0-9]{3,4}).zip/\1/')
file="Dockerfile"

current_version=$(grep "ARG version_number=" ${file})
new_version="ARG version_number=${version}"

if [ "${current_version}" != "${new_version}" ]; then
	echo "Not latest"
	sed -i "s/${current_version}/${new_version}/" "${file}"
	sed -i "s/ARG download_url=https.*/ARG download_url=${download_url//\//\\/}/" "${file}"
	exit 0
fi
exit 1
