##!/bin/bash
source /dev/shm/.tokenv || true 
grep_numbers_float() { grep -Eo '[+-]?[0-9]+([.][0-9]+)?' ; } ;

octet_one="$1"
octet_two="$2"
startdir="$3"
uptime
#octet_three=$3
test -e /tmp/.privnet.py || (
echo "IyBjb2Rpbmc9dXRmOAojIHRoZSBhYm92ZSB0YWcgZGVmaW5lcyBlbmNvZGluZyBmb3IgdGhpcyBkb2N1bWVudCBhbmQgaXMgZm9yIFB5dGhvbiAyLnggY29tcGF0aWJpbGl0eQppbXBvcnQgc3lzCmltcG9ydCByZQoKcmVnZXggPSByIlxiKDEyN1wuKD86MjVbMC01XXwyWzAtNF1bMC05XXxbMDFdP1swLTldWzAtOV0/KVwuKD86MjVbMC01XXwyWzAtNF1bMC05XXxbMDFdP1swLTldWzAtOV0/KVwuKD86MjVbMC01XXwyWzAtNF1bMC05XXxbMDFdP1swLTldWzAtOV0/KXwwPzEwXC4oPzoyNVswLTVdfDJbMC00XVswLTldfFswMV0/WzAtOV1bMC05XT8pXC4oPzoyNVswLTVdfDJbMC00XVswLTldfFswMV0/WzAtOV1bMC05XT8pXC4oPzoyNVswLTVdfDJbMC00XVswLTldfFswMV0/WzAtOV1bMC05XT8pfDE3MlwuMD8xWzYtOV1cLig/OjI1WzAtNV18MlswLTRdWzAtOV18WzAxXT9bMC05XVswLTldPylcLig/OjI1WzAtNV18MlswLTRdWzAtOV18WzAxXT9bMC05XVswLTldPyl8MTcyXC4wPzJbMC05XVwuKD86MjVbMC01XXwyWzAtNF1bMC05XXxbMDFdP1swLTldWzAtOV0/KVwuKD86MjVbMC01XXwyWzAtNF1bMC05XXxbMDFdP1swLTldWzAtOV0/KXwxNzJcLjA/M1swMV1cLig/OjI1WzAtNV18MlswLTRdWzAtOV18WzAxXT9bMC05XVswLTldPylcLig/OjI1WzAtNV18MlswLTRdWzAtOV18WzAxXT9bMC05XVswLTldPyl8MTkyXC4xNjhcLig/OjI1WzAtNV18MlswLTRdWzAtOV18WzAxXT9bMC05XVswLTldPylcLig/OjI1WzAtNV18MlswLTRdWzAtOV18WzAxXT9bMC05XVswLTldPyl8MTY5XC4yNTRcLig/OjI1WzAtNV18MlswLTRdWzAtOV18WzAxXT9bMC05XVswLTldPylcLig/OjI1WzAtNV18MlswLTRdWzAtOV18WzAxXT9bMC05XVswLTldPyl8OjoxfFtmRl1bY0NkRF1bMC05YS1mQS1GXXsyfSg/Ols6XVswLTlhLWZBLUZdezAsNH0pezAsN318W2ZGXVtlRV1bODlhQWJCXVswLTlhLWZBLUZdKD86WzpdWzAtOWEtZkEtRl17MCw0fSl7MCw3fSkoPzpcLyhbNzg5XXwxP1swLTldezJ9KSk/XGIiCnRlc3Rfc3RyID0gKHN5cy5hcmd2WzFdKyJcbiIgKQptYXRjaGVzID0gcmUuZmluZGl0ZXIocmVnZXgsIHRlc3Rfc3RyLCByZS5NVUxUSUxJTkUpCmZvciBtYXRjaE51bSwgbWF0Y2ggaW4gZW51bWVyYXRlKG1hdGNoZXMsIHN0YXJ0PTEpOgogICAgcHJpbnQgKCJNYXRjaCB7bWF0Y2hOdW19IHdhcyBmb3VuZCBhdCB7c3RhcnR9LXtlbmR9OiB7bWF0Y2h9Ii5mb3JtYXQobWF0Y2hOdW0gPSBtYXRjaE51bSwgc3RhcnQgPSBtYXRjaC5zdGFydCgpLCBlbmQgPSBtYXRjaC5lbmQoKSwgbWF0Y2ggPSBtYXRjaC5ncm91cCgpKSkKIyAgICBmb3IgZ3JvdXBOdW0gaW4gcmFuZ2UoMCwgbGVuKG1hdGNoLmdyb3VwcygpKSk6CiMgICAgICAgIGdyb3VwTnVtID0gZ3JvdXBOdW0gKyAxCiMgICAgICAgIHByaW50ICgiR3JvdXAge2dyb3VwTnVtfSBmb3VuZCBhdCB7c3RhcnR9LXtlbmR9OiB7Z3JvdXB9Ii5mb3JtYXQoZ3JvdXBOdW0gPSBncm91cE51bSwgc3RhcnQgPSBtYXRjaC5zdGFydChncm91cE51bSksIGVuZCA9IG1hdGNoLmVuZChncm91cE51bSksIGdyb3VwID0gbWF0Y2guZ3JvdXAoZ3JvdXBOdW0pKSkKIyBOb3RlOiBmb3IgUHl0aG9uIDIuNyBjb21wYXRpYmlsaXR5LCB1c2UgdXIiIiB0byBwcmVmaXggdGhlIHJlZ2V4IGFuZCB1IiIgdG8gcHJlZml4IHRoZSB0ZXN0IHN0cmluZyBhbmQgc3Vic3RpdHV0aW9uLgo=" |base64 -d > /tmp/.privnet.py
)
#for octet_two in 0 $(seq 1 254);do 
#octet_two
echo "#######################################"
ERRFILT=" -e ERROR_1 -e ERROR_2 -e ERROR_3 -e ERROR_4 -e ERROR_5"
for octet_three in 0 $(seq 1 254);do 

            [[ $(uptime|cut -d, -f5|cut -d. -f1|cut -d" " -f2) -ge 15 ]]   && (sleep 23  ;  echo "GEN_load_throttled 23 s FOR ${octet_one}.${octet_two}.${octet_three} LOAD: "$(uptime|cut -d, -f5|cut -d. -f1|cut -d" " -f2) >&2 )
            [[ $(uptime|cut -d, -f5|cut -d. -f1|cut -d" " -f2) -ge 12 ]]   && (sleep 15  ;  echo "GEN_load_throttled 15 s FOR ${octet_one}.${octet_two}.${octet_three} LOAD: "$(uptime|cut -d, -f5|cut -d. -f1|cut -d" " -f2) >&2 )
            [[ $(uptime|cut -d, -f5|cut -d. -f1|cut -d" " -f2) -ge 10 ]]   && (sleep 15  ;  echo "GEN_load_throttled 15 s FOR ${octet_one}.${octet_two}.${octet_three} LOAD: "$(uptime|cut -d, -f5|cut -d. -f1|cut -d" " -f2) >&2 )
            [[ $(uptime|cut -d, -f5|cut -d. -f1|cut -d" " -f2) -ge 8 ]]    && (sleep 10  ;  echo "GEN_load_throttled 10 s FOR ${octet_one}.${octet_two}.${octet_three} LOAD: "$(uptime|cut -d, -f5|cut -d. -f1|cut -d" " -f2) >&2 )
            [[ $(uptime|cut -d, -f5|cut -d. -f1|cut -d" " -f2) -ge 6 ]]    && (sleep 5   ;  echo "GEN_load_throttled 5  s FOR ${octet_one}.${octet_two}.${octet_three} LOAD: "$(uptime|cut -d, -f5|cut -d. -f1|cut -d" " -f2) >&2 )
            while ( [[ $(netstat -puteen 2>/dev/null |grep -e ^tcp -e ^udp |grep -v 127.0.0.1 |wc -l ) -ge 1666 ]] ) ;do 
                echo "GEN_sleeping until less than 1666 connections , CONNS: "$(sudo netstat -puteen 2>/dev/null|grep -v 127.0.0.1 |wc -l ) >&2;sleep 5;done
            #[[ $(sudo netstat -puteen 2>/dev/null|grep -v 127.0.0.1 |wc -l ) -ge 888   ]]     && (sleep 12  ;  echo "GEN_conn_throttled 12   s FOR ${octet_one}.${octet_two}.${octet_three} CONNs: "$(sudo netstat -puteen 2>/dev/null|grep -v 127.0.0.1 |wc -l ) >&2 )
            [[ $(sudo netstat -puteen 2>/dev/null|grep -v 127.0.0.1 |wc -l ) -ge 1111  ]]     && (sleep  4   ;  echo "GEN_conn_throttled  4   s FOR ${octet_one}.${octet_two}.${octet_three} CONNs: "$(sudo netstat -puteen 2>/dev/null|grep -v 127.0.0.1 |wc -l ) >&2 )
            [[ $(sudo netstat -puteen 2>/dev/null|grep -v 127.0.0.1 |wc -l ) -ge 999   ]]     && (sleep  0.5 ;  echo "GEN_conn_throttled  0.5 s FOR ${octet_one}.${octet_two}.${octet_three} CONNs: "$(sudo netstat -puteen 2>/dev/null|grep -v 127.0.0.1 |wc -l ) >&2 )
#test -e  /tmp/tmp_${octet_one}/lists/${octet_one}/${octet_one}.${octet_two} || mkdir -p  /tmp/tmp_${octet_one}/lists/${octet_one}/${octet_one}.${octet_two}
test -e "${startdir}/upload/lists/${octet_one}/${octet_one}.${octet_two}" || mkdir -p "${startdir}/upload/lists/${octet_one}/${octet_one}.${octet_two}"
python3  /tmp/.privnet.py  ${octet_one}.${octet_two}.${octet_three}.1 |grep Match ||  (  
##     echo  {0..254}.${octet_three}.${octet_two}.${octet_one}.in-addr.arpa |sed 's/ /\n/g'  > /tmp/req${octet_three}.${octet_two}.${octet_one};
#     mkdir  /tmp/out${octet_three}.${octet_two}.${octet_one}/
#     ########################################/tmp/dns -r /tmp/resolvers  -t PTR -w /tmp/out${octet_three}.${octet_two}.${octet_one}  /tmp/req${octet_three}.${octet_two}.${octet_one} ;
##     /tmp/dns --outfile /tmp/out${octet_three}.${octet_two}.${octet_one}/res --processes 4 -r /tmp/resolvers  --type PTR /tmp/req${octet_three}.${octet_two}.${octet_one} 2>/tmp/log${octet_three}.${octet_two}.${octet_one} ;
#     (cd /tmp/out${octet_three}.${octet_two}.${octet_one}/; proxychains python3 /tmp/mydoh.py ${octet_one} ${octet_two} ${octet_three} 2>&1 |grep -v -e ERROR_1 -e ProxyChains -e proxychains -e DeprecationWarning  -e get_event_loop)
#     test -e /tmp/tmp_${octet_one}/lists/${octet_one}/${octet_one}.${octet_two}/ || mkdir -p /tmp/tmp_${octet_one}/lists/${octet_one}/${octet_one}.${octet_two}/
#     find /tmp/out${octet_three}.${octet_two}.${octet_one}/ -type f |wc -l |grep -q ^0$ || (
#     test -e /tmp/out${octet_three}.${octet_two}.${octet_one}/ && wc -l /tmp/out${octet_three}.${octet_two}.${octet_one}/*
#     test -e /tmp/log${octet_three}.${octet_two}.${octet_one}  && (grep -e SERVFAIL -e REFUSE -e NXDOMAIN -e OK /tmp/log${octet_three}.${octet_two}.${octet_one}|sed 's/^/ip4_'${octet_one}.${octet_two}.${octet_three}'| /g'  ; rm /tmp/log${octet_three}.${octet_two}.${octet_one}  ) 
#     test -e /tmp/req${octet_three}.${octet_two}.${octet_one}  && rm /tmp/req${octet_three}.${octet_two}.${octet_one} &
#     find /tmp/tmp_${octet_one}/lists/ -empty -delete
#     test -e /tmp/out${octet_three}.${octet_two}.${octet_one}  && (ls -1 /tmp/out${octet_three}.${octet_two}.${octet_one}/|grep out -q ) && ( 
#         cat /tmp/out${octet_three}.${octet_two}.${octet_one}/* 2>/dev/null |grep "|"| >  /tmp/tmp_${octet_one}/lists/${octet_one}/${octet_one}.${octet_two}/${octet_one}.${octet_two}.${octet_three} )
#     )
     (  
         #cd /tmp/tmp_${octet_one}/lists/${octet_one}/${octet_one}.${octet_two}; 
         cd ${startdir}/upload/lists/${octet_one}/${octet_one}.${octet_two}
         do_lookup="yes"
        cat /tmp/.list.netdrive 2>/dev/null | grep -q netinfo/raw/${octet_one}.${octet_two}.${octet_three}.tgz && do_lookup="no"
         [[ "$do_lookup" = "no" ]]  && ( echo "skipping FOR ${octet_one}/${octet_two} IN ${startdir}/upload/lists/${octet_one}/${octet_one}.${octet_two}" .. gz found ) &
         [[ "$do_lookup" = "yes" ]] &&   echo " running FOR ${octet_one}/${octet_two} IN ${startdir}/upload/lists/${octet_one}/${octet_one}.${octet_two}" &
         [[ "$do_lookup" = "yes" ]] && sleep 0.$(($RANDOM%9))
         [[ "$do_lookup" = "yes" ]] && test -e /dev/shm/.process_running && (
            mystart=$(date -u +%s)
            export INFLUX_MEASUREMENT=buildtime
            dohdirect="no"
            ## 1/4 of req are sent direct
            [[ $(($octet_three%4)) -eq 0 ]] && dohdirect="yes"
            [[ $(($octet_three%4)) -eq 0 ]] || dohdirect="no"
            ## but only with not too many connections
            [[ $(sudo netstat -puteen 2>/dev/null|grep -v 127.0.0.1 |wc -l ) -ge 1111 ]] && dohdirect="no"
            time (

            [[ "${dohdirect}" = "yes" ]]  ||   proxychains python3 /tmp/mydoh.py ${octet_one} ${octet_two} ${octet_three} 2>&1 |grep -v $ERRFILT
            [[ "${dohdirect}" = "yes" ]]  &&               python3 /tmp/mydoh.py ${octet_one} ${octet_two} ${octet_three} 2>&1 |grep -v $ERRFILT
            )
            myend=$(date -u +%s)
            export INFLUX_MEASUREMENT=buildtime            
            echo $(($myend-$mystart)) |bash /tmp/bash-logger/log-to-influxdb2.sh "${LOGTOINFLUXURL}" buildstatus "${LOGTOINFLUXORG}" FALSE buildtime "${LOGTOINFLUXTOKEN}" OCT_${octet_one}_$STATSTARGET &
            
         ) |grep -v $ERRFILT -e ProxyChains -e proxychains -e DeprecationWarning  -e get_event_loop
         test -e out.${octet_one}.${octet_two}.${octet_three} &&  ( 
                mv out.${octet_one}.${octet_two}.${octet_three} ${octet_one}.${octet_two}.${octet_three} ; wc -l  ${octet_one}.${octet_two}.${octet_three}  ;
                (tar cvzf /tmp/${octet_one}.${octet_two}.${octet_three}.tgz ${octet_one}.${octet_two}.${octet_three} && (
                    curlcmdbase=""
                    #curlcmdbase=$(echo curl -kL -w "%{http_code}" -T /tmp/${octet_one}.${octet_two}.${octet_three}.tgz -u ${WEBDAV_TOKEN} ${WEBDAV_URL}"netinfo/raw/"${octet_one}.${octet_two}.${octet_three}.tgz |base64 -w0)

                    echo -n "uploading: $curlcmdbase ( "$(du -k /tmp/${octet_one}.${octet_two}.${octet_three}.tgz |cut -f1)" k)-> "$( curl -kLs -w "%{http_code}" -T /tmp/${octet_one}.${octet_two}.${octet_three}.tgz -u ${WEBDAV_TOKEN} ${WEBDAV_URL}"netinfo/raw/"${octet_one}.${octet_two}.${octet_three}.tgz >/tmp/.uploadout)) ; test -e /tmp/${octet_one}.${octet_two}.${octet_three}.tgz && rm /tmp/${octet_one}.${octet_two}.${octet_three}.tgz  ;echo ) & )
        

     ) 
     test -e /tmp/out${octet_three}.${octet_two}.${octet_one}  && rm /tmp/out${octet_three}.${octet_two}.${octet_one}/ -rf
      ) #&   




done
uptime
wait
#find lists -type f -exec wc -l {} \;
echo gen quitting from $(pwd)
#done



