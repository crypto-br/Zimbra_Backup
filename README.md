# Zimbra_Backup
Script for Zimbra Core mail box's backup

Save script on folder /opt/zimbra/ <br />

Create folder "backup" on /opt/zimbra/ <br />
$ mkdir /opt/zimbra/backup <br />

Use zimbra-backup.sh: <br />
$ sh zimbra-backup.sh 1 : for add mail box on script <br />
$ sh zimbra-backup.sh 2 : for run backup mail box's <br />

You can add the script in crontab by passing the option to perform backup:<br />
sh zimbra-backup.sh 2 <br />
