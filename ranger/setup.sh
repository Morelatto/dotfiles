#!/bin/bash

MY_DIR=$(dirname $(realpath -s $0))
RANGER_CONFIG_DIR=$XDG_CONFIG_HOME/ranger

pacman -S ranger python-pygments
pip uninstall -y pillow
pip install ueberzug pillow-simd 

cp /usr/share/doc/ranger/config/scope.sh $RANGER_CONFIG_DIR/scope.sh
ln -sf $MY_DIR/rc.conf $RANGER_CONFIG_DIR/rc.conf
