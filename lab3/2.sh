#!/bin/bash

at now + 1minutes -f ./1.sh 2>/dev/null
tail -n 0 -f ~/report.tmp
