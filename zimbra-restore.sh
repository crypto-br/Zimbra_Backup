#!/bin/bash

echo "Entry mail box for restore: ex my@mycompany.com"
read MBOX
echo "Entrey locate file backup: ex /opt/zimbra/backup/my-mycompany.tgz
read FILE
echo ""
echo "Restore runing..."
sleep 1 

zmmailbox -z -m $MBOX postRestURL '//?fmt=tgz&resolve=skip' $FILE

echo "Restore finish !"
