#!/bin/bash

(sleep 60; ./1.sh) &
tail -n 0 -f ~/report.tmp &
