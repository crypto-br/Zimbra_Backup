#!/bin/bash
#----------------------------------#
#-- Backup Zimbra Core Mail Box --#
#-- @cryptobr on Telegram ---------#
#----------------------------------#


echo "For add new box on backup use: sh zimbra-backup.sh 1"
echo "For Run backups use: sh zimbra-backup.sh 2"
echo ""
echo ""

VAR1="$1"

if [ $VAR1 -eq 1 ]
then
	# Add new box for backup
	echo "Entry your Domain: ex: mydomain.com"
	read DOMAIN
	echo "Entry your name mail box: "
	read NAME
	sleep 1
	echo ""
	echo "Your mails box is: $NAME@$DOMAIN"
	echo ""
	
	tail -n1 /opt/zimbra/backup/zimbra-backup.sh | wc -c | xargs -I {} truncate /opt/zimbra/backup/zimbra-backup.sh -s -{}
	echo "zmmailbox -z -m $NAME@$DOMAIN getRestURL "//?fmt=tgz" > /opt/zimbra/backup/youdomain/$NAME-$(date +%d)-$(date +%m)-$(date +%y).tgz" >> /opt/zimbra/backup/zimbra-backup.sh
	echo "Backup Contact : Success " >> /opt/zimbra/backup/zimbra-backup.sh
	echo "fi" >> /opt/zimbra/backup/zimbra-backup.sh
	echo "Mail Box add on backup"
fi

if [ $VAR1 -eq 2 ]
then
	# Run backup
	echo "Start Backup Box"
	
	# Account Contact Backup
	zmmailbox -z -m contact@youdomain.com getRestURL "//?fmt=tgz" > /opt/zimbra/backup/youdomain/contact-$(date +%d)-$(date +%m)-$(date +%y).tgz
	echo "Backup Contact : Success "
fi



