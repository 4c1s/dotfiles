#!/usr/bin/env sh

BLUR=$(hyprctl getoption decoration:blur:enabled | awk 'NR==1{print $2}')

if [ "$BLUR" = 1 ]; then
  hyprctl keyword decoration:blur:enabled 0;
  exit 0
fi

hyprctl reload
