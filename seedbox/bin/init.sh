#!/bin/bash
chown root -R /share/www/rt/share
rtorrent -n -o import=/share/rtorrent/config/.rtorrent.rc
