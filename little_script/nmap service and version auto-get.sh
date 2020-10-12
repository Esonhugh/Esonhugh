<nmap command>|grep -G [[:digit:]][.][[:digit:]]|tail -n +4|awk '/[0-9]*\/(tcp|udp)/ {print $4$5$6}'

#nmap service and version auto-get
