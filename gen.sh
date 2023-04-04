##!/bin/bash
#
#octet_one=$1
#octet_two=$2
#octet_three=$3
#
#test -e lists/${octet_one}/${octet_one}.${octet_two} || mkdir -p lists/${octet_one}/${octet_one}.${octet_two}
#time (
#     ( echo {0..254}.${octet_three}.${octet_two}.${octet_one}.in-addr.arpa |sed 's/ /\n/g' ) | ( 
#          /tmp/dns -r /tmp/resolvers -t PTR -|grep PTR|grep -v PTR$ > lists/${octet_one}/${octet_one}.${octet_two}/${octet_one}.${octet_two}.${octet_three} )