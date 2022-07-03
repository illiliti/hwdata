#!/bin/sh -eux

cd "${MESON_SOURCE_ROOT:-.}"

curl -z pci.ids -sROL http://pci-ids.ucw.cz/v2.2/pci.ids
curl -z usb.ids -sROL https://usb-ids.gowdy.us/usb.ids

curl -z pnp.ids -sL https://uefi.org/uefi-pnp-export | ./parse_pnp.sh > _
[ -s _ ] && mv -f _ pnp.ids || rm -f _

# https://lists.debian.org/debian-legal/2006/02/msg00174.html
# https://lists.debian.org/debian-legal/2013/08/msg00003.html
# https://flameeyes.blog/2012/04/10/who-said-that-ids-wouldn-t-have-license-issues/
#
# TL;DR it's unclear whether re-distributing these files is legal
# 
curl -z oui.txt -sROL https://standards-oui.ieee.org/oui/oui.txt
curl -z iab.txt -sROL https://standards-oui.ieee.org/iab/iab.txt
