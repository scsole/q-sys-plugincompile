#!/bin/sh

curdir="$(pwd)"
regexp='^[\\/][\\/][^\\/]*[\\/][^\\/]*'
if [ -n "$(echo "$curdir" | grep $regexp)" ]; then
    echo "Current Directory is in Network"
    profile="$(echo "$curdir" | sed "s/\($regexp\).*/\1/")"
    [ -d "$profile/$pluginsDir" ] &&
        USERPROFILE="$profile" &&
        echo "USERPROFILE changed to-> $USERPROFILE"
else
    curdir="$1"
fi

[ -z "${USERPROFILE}" ] && USERPROFILE="$HOME"
pluginsPath='Documents/QSC/Q-Sys Designer/Plugins'
rm "info.lua-E" 2>/dev/null | true

cd "${USERPROFILE}"
mkdir -p "${pluginsPath}"
if [ -e "${curdir}/${2}.qplugx" ]; then
    echo "Copying encrypted plugin to ${USERPROFILE}/${pluginsPath}/${2}.qplugx"
    cp "${curdir}/${2}.qplugx" \
        "${USERPROFILE}/${pluginsPath}/${2}.qplugx"
else
    echo "Copying plugin to ${USERPROFILE}/${pluginsPath}/${2}.qplug"
    cp "${curdir}/${2}.qplug" \
        "${USERPROFILE}/${pluginsPath}/${2}.qplug"
fi
