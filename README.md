# Zimbra_Backup
Script for Zimbra Core mail box's backup

Save script on folder /opt/zimbra/

Create folder "backup" on /opt/zimbra/
$ mkdir /opt/zimbra/backup

Use zimbra-backup.sh:
$ sh zimbra-backup.sh 1 : for add mail box on script
$ sh zimbra-backup.sh 2 : for run backup mail box's

You can add the script in crontab by passing the option to perform backup:
sh zimbra-backup.sh 2
