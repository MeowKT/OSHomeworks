#!/bin/bash

mail="[[:alnum:]_.]+@[[:alnum:]_]+(\.[[:alpha:]]+)+"
grep -E -h -s -o $mail /etc/* | awk '{printf("%s, ",$1)}' | sed -E "s/,\s$/./g" > emails.lst
