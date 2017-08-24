#!/bin/sh
# Parse pacman output and determine compiler
for I in `pacman -Q | awk '{ print $1 }'`; do
      IS_COMPILER=`pacman -Qi $I | egrep -i "compil"`
        if [ ! "${IS_COMPILER}" = "" ]; then echo $I; fi
    done
