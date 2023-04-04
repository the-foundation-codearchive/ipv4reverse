##!/bin/bash
###
octet_one=$1
octet_two=$2
uptime
#octet_three=$3
test -e /tmp/.privnet.py || (
echo "IyBjb2Rpbmc9dXRmOAojIHRoZSBhYm92ZSB0YWcgZGVmaW5lcyBlbmNvZGluZyBmb3IgdGhpcyBkb2N1bWVudCBhbmQgaXMgZm9yIFB5dGhvbiAyLnggY29tcGF0aWJpbGl0eQppbXBvcnQgc3lzCmltcG9ydCByZQoKcmVnZXggPSByIlxiKDEyN1wuKD86MjVbMC01XXwyWzAtNF1bMC05XXxbMDFdP1swLTldWzAtOV0/KVwuKD86MjVbMC01XXwyWzAtNF1bMC05XXxbMDFdP1swLTldWzAtOV0/KVwuKD86MjVbMC01XXwyWzAtNF1bMC05XXxbMDFdP1swLTldWzAtOV0/KXwwPzEwXC4oPzoyNVswLTVdfDJbMC00XVswLTldfFswMV0/WzAtOV1bMC05XT8pXC4oPzoyNVswLTVdfDJbMC00XVswLTldfFswMV0/WzAtOV1bMC05XT8pXC4oPzoyNVswLTVdfDJbMC00XVswLTldfFswMV0/WzAtOV1bMC05XT8pfDE3MlwuMD8xWzYtOV1cLig/OjI1WzAtNV18MlswLTRdWzAtOV18WzAxXT9bMC05XVswLTldPylcLig/OjI1WzAtNV18MlswLTRdWzAtOV18WzAxXT9bMC05XVswLTldPyl8MTcyXC4wPzJbMC05XVwuKD86MjVbMC01XXwyWzAtNF1bMC05XXxbMDFdP1swLTldWzAtOV0/KVwuKD86MjVbMC01XXwyWzAtNF1bMC05XXxbMDFdP1swLTldWzAtOV0/KXwxNzJcLjA/M1swMV1cLig/OjI1WzAtNV18MlswLTRdWzAtOV18WzAxXT9bMC05XVswLTldPylcLig/OjI1WzAtNV18MlswLTRdWzAtOV18WzAxXT9bMC05XVswLTldPyl8MTkyXC4xNjhcLig/OjI1WzAtNV18MlswLTRdWzAtOV18WzAxXT9bMC05XVswLTldPylcLig/OjI1WzAtNV18MlswLTRdWzAtOV18WzAxXT9bMC05XVswLTldPyl8MTY5XC4yNTRcLig/OjI1WzAtNV18MlswLTRdWzAtOV18WzAxXT9bMC05XVswLTldPylcLig/OjI1WzAtNV18MlswLTRdWzAtOV18WzAxXT9bMC05XVswLTldPyl8OjoxfFtmRl1bY0NkRF1bMC05YS1mQS1GXXsyfSg/Ols6XVswLTlhLWZBLUZdezAsNH0pezAsN318W2ZGXVtlRV1bODlhQWJCXVswLTlhLWZBLUZdKD86WzpdWzAtOWEtZkEtRl17MCw0fSl7MCw3fSkoPzpcLyhbNzg5XXwxP1swLTldezJ9KSk/XGIiCnRlc3Rfc3RyID0gKHN5cy5hcmd2WzFdKyJcbiIgKQptYXRjaGVzID0gcmUuZmluZGl0ZXIocmVnZXgsIHRlc3Rfc3RyLCByZS5NVUxUSUxJTkUpCmZvciBtYXRjaE51bSwgbWF0Y2ggaW4gZW51bWVyYXRlKG1hdGNoZXMsIHN0YXJ0PTEpOgogICAgcHJpbnQgKCJNYXRjaCB7bWF0Y2hOdW19IHdhcyBmb3VuZCBhdCB7c3RhcnR9LXtlbmR9OiB7bWF0Y2h9Ii5mb3JtYXQobWF0Y2hOdW0gPSBtYXRjaE51bSwgc3RhcnQgPSBtYXRjaC5zdGFydCgpLCBlbmQgPSBtYXRjaC5lbmQoKSwgbWF0Y2ggPSBtYXRjaC5ncm91cCgpKSkKIyAgICBmb3IgZ3JvdXBOdW0gaW4gcmFuZ2UoMCwgbGVuKG1hdGNoLmdyb3VwcygpKSk6CiMgICAgICAgIGdyb3VwTnVtID0gZ3JvdXBOdW0gKyAxCiMgICAgICAgIHByaW50ICgiR3JvdXAge2dyb3VwTnVtfSBmb3VuZCBhdCB7c3RhcnR9LXtlbmR9OiB7Z3JvdXB9Ii5mb3JtYXQoZ3JvdXBOdW0gPSBncm91cE51bSwgc3RhcnQgPSBtYXRjaC5zdGFydChncm91cE51bSksIGVuZCA9IG1hdGNoLmVuZChncm91cE51bSksIGdyb3VwID0gbWF0Y2guZ3JvdXAoZ3JvdXBOdW0pKSkKIyBOb3RlOiBmb3IgUHl0aG9uIDIuNyBjb21wYXRpYmlsaXR5LCB1c2UgdXIiIiB0byBwcmVmaXggdGhlIHJlZ2V4IGFuZCB1IiIgdG8gcHJlZml4IHRoZSB0ZXN0IHN0cmluZyBhbmQgc3Vic3RpdHV0aW9uLgo=" |base64 -d > /tmp/.privnet.py
)
#for octet_two in 0 $(seq 1 254);do 
#octet_two
echo "running FOR ${octet_one}/${octet_one}"
for octet_three in 0 $(seq 1 254);do 

test -e lists/${octet_one}/${octet_one}.${octet_two} || mkdir -p lists/${octet_one}/${octet_one}.${octet_two}
python3  /tmp/.privnet.py ${octet_one}.${octet_two}.${octet_three}.1 |grep Match || time (  
     echo {0..254}.${octet_three}.${octet_two}.${octet_one}.in-addr.arpa |sed 's/ /\n/g'  > /tmp/req${octet_three}.${octet_two}.${octet_one};
      mkdir  /tmp/out${octet_three}.${octet_two}.${octet_one}/
#     /tmp/dns -r /tmp/resolvers  -t PTR -w /tmp/out${octet_three}.${octet_two}.${octet_one}  /tmp/req${octet_three}.${octet_two}.${octet_one} ;
     /tmp/dns --outfile /tmp/out${octet_three}.${octet_two}.${octet_one}/res --processes 2 -r /tmp/resolvers  --type PTR /tmp/req${octet_three}.${octet_two}.${octet_one} 2>/tmp/log${octet_three}.${octet_two}.${octet_one} ;
     test -e /tmp/out${octet_three}.${octet_two}.${octet_one}/ && wc -l /tmp/out${octet_three}.${octet_two}.${octet_one}/*
     test -e /tmp/log${octet_three}.${octet_two}.${octet_one} && (grep -e SERVFAIL -e REFUSE -e NXDOMAIN -e OK /tmp/log${octet_three}.${octet_two}.${octet_one}|sed 's/^/ip4_'${octet_one}.${octet_two}.${octet_three}'| /g'  ; rm /tmp/log${octet_three}.${octet_two}.${octet_one}  ) 
     test -e /tmp/req${octet_three}.${octet_two}.${octet_one} && rm /tmp/req${octet_three}.${octet_two}.${octet_one} &
     find lists -empty -delete
     test -e /tmp/out${octet_three}.${octet_two}.${octet_one} && ( cat /tmp/out${octet_three}.${octet_two}.${octet_one}/* |grep PTR|grep -v PTR$ |grep -v ^$|while read a ;do echo $(date +%s)"|$a" ;done  > lists/${octet_one}/${octet_one}.${octet_two}/${octet_one}.${octet_two}.${octet_three} )
     test -e /tmp/out${octet_three}.${octet_two}.${octet_one} && rm /tmp/out${octet_three}.${octet_two}.${octet_one}/ -rf
      ) &   

sleep 0.2
sleep 0.$(($RANDOM%9))

done
uptime
wait
find lists -type f -exec wc -l {} \;
#done