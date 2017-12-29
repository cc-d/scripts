#!/usr/bin/env bash
# SCRIPT SETS UP AN UNSAFE UNSECURE HTTP SQUID PROXY - ONLY USE IF NEEDED A PROXY QUICKLY AND TEMPORARY 
# MAKE SURE TO STOP SQUID AFTER FINISHED USING
# Use IP of server and port 11337

apt-get update
apt-get upgrade
apt-get install squid

cp /etc/squid/squid.conf{,.old} && \
cat > /etc/squid/squid.conf <<EOF
http_port 11337
via off
forwarded_for off

request_header_access Allow allow all
request_header_access Authorization allow all
request_header_access WWW-Authenticate allow all
request_header_access Proxy-Authorization allow all
request_header_access Proxy-Authenticate allow all
request_header_access Cache-Control allow all
request_header_access Content-Encoding allow all
request_header_access Content-Length allow all
request_header_access Content-Type allow all
request_header_access Date allow all
request_header_access Expires allow all
request_header_access Host allow all
request_header_access If-Modified-Since allow all
request_header_access Last-Modified allow all
request_header_access Location allow all
request_header_access Pragma allow all
request_header_access Accept allow all
request_header_access Accept-Charset allow all
request_header_access Accept-Encoding allow all
request_header_access Accept-Language allow all
request_header_access Content-Language allow all
request_header_access Mime-Version allow all
request_header_access Retry-After allow all
request_header_access Title allow all
request_header_access Connection allow all
request_header_access Proxy-Connection allow all
request_header_access User-Agent allow all
request_header_access Cookie allow all
request_header_access All deny all

http_access allow all
EOF

service squid restart
