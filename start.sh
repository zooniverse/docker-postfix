#!/bin/bash

sed -i -r -e "s/^mynetworks (.*)/mynetworks \1 172.16.0.0\/12/" /etc/postfix/main.cf

service rsyslog start
service postfix start

tail -F /var/log/mail.log &

while postfix status >dev/null 2>&1
do
  sleep 60
done

exit 1
