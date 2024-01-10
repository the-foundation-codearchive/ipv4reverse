#!/bin/bash
echo '
# General gigabit tuning:
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 65536 16777216
net.ipv4.tcp_syncookies = 1
# this gives the kernel more memory for tcp
# which you need with many (100k+) open socket connections
net.ipv4.tcp_mem = 50576   64768   98152
net.core.netdev_max_backlog = 2500
# I was also masquerading the port comet was on, you might not need this
net.ipv4.netfilter.ip_conntrack_max = 1048576
### Kernel settings for TCP

# Provide adequate buffer memory.
# rmem_max and wmem_max are TCP max buffer size
# settable with setsockopt(), in bytes
# tcp_rmem and tcp_wmem are per socket in bytes.
# tcp_mem is for all TCP streams, in 4096-byte pages.
# The following are suggested on IBM_s
# High Performance Computing page
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.core.rmem_default = 16777216
net.core.wmem_default = 16777216
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 87380 16777216
# This server might have 200 clients simultaneously, so:
#   max(tcp_wmem) * 2 * 200 / 4096
net.ipv4.tcp_mem = 1638400 1638400 1638400

# Disable TCP SACK (TCP Selective Acknowledgement),
# DSACK (duplicate TCP SACK), and FACK (Forward Acknowledgement)
net.ipv4.tcp_sack = 0
net.ipv4.tcp_dsack = 0
net.ipv4.tcp_fack = 0

# Disable the gradual speed increase that_s useful
# on variable-speed WANs but not for us
net.ipv4.tcp_slow_start_after_idle = 0 


net.ipv4.tcp_syncookies = 1 
net.ipv4.tcp_tw_reuse = 1 
net.ipv4.tcp_tw_recycle = 1 
net.ipv4.tcp_timestamps = 1 
net.ipv4.tcp_fin_timeout = 30 
net.nf_conntrack_max = 655360 
net.netfilter.nf_conntrack_tcp_timeout_established  = 180    
net.netfilter.nf_conntrack_tcp_timeout_unacknowledged = 120

' |grep -v -e "^#" -e ^$|grep "="|sed 's/ //g'|while read o; do sudo sysctl -w "$o"|| true & sleep 0.02 ;done
exit 0