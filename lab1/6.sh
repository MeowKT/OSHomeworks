#!/bin/bash

grep -E "\(WW\)" /var/log/Xorg.0.log | sed "s/\(II\)/Warning: /" > full.log
grep -E "\(II\)" /var/log/Xorg.0.log | sed "s/\(II\)/Information: /" > full.log