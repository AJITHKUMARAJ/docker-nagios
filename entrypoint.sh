#!/bin/bash

if [ ! -f /.configured ]; then
	if [ -z "$NAGIOSADM_PW" ]; then
		echo "NAGIOSADM_PW not set."
		exit 1
	fi
	if [ -z "$NAGIOSADM_EMAIL" ]; then
		echo "NAGIOSADM_EMAIL not set."
		exit 1
	fi

	echo "Configuring Nagios admin account."
	htpasswd -b -c /usr/local/nagios/etc/htpasswd.users nagiosadmin $NAGIOSADM_PW
	sed -r "s/nagios@localhost/$NAGIOSADM_EMAIL/" /usr/local/nagios/etc/objects/contacts.cfg > /tmp.cfg
	mv /tmp.cfg /usr/local/nagios/etc/objects/contacts.cfg
	touch /.configured
fi

service apache2 start
service nagios start
tail -f /usr/local/nagios/var/nagios.log
