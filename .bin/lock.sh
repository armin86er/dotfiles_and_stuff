#!/bin/bash
sh -c "xsecurelock auth_pam_x11 saver_blank || kill -9 -1" &
systemctl suspend
