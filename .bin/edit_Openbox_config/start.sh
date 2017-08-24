#!/bin/bash
cp ~/.config/openbox/rc.xml.original_formatted.bak ~/.config/openbox/rc.xml
ruby main.rb | vimpager
