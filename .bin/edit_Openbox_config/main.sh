#!/bin/bash

log=~/.bin/log

ruby ~/.bin/edit_Openbox_config/main.rb  	\
    > $log/screenConf.out   \
    2> $log/screenConf.err
