#!/bin/bash
echo "print number"
echo "1 = nano"
echo "2 = vi"
echo "3 = links"
echo "4 = exit"
read n
case $n in
1 )
exec nano
;;
2 )
exec vim
;;
3 )
exec links
;;
4 )
exit 0
;;
esac