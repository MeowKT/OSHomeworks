#!/bin/bash

man bash | grep -o "[[:alpha:]]\{4,\}" | tr "[:upper:]" "[:lower:]" | sort | uniq -c | sort -r -nk1 | head -3 | awk '{print $2}'