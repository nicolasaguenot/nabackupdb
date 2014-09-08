#!/bin/sh

## DB
DBNAME=[YOUR_DATABASE_NAME]
DBUSER=[YOUR_DATABASE_USER]
DBPSWD=[YOUR_DATABASE_PASSWORD]

## FOLDER
LASTBACKUPFOLDER=sql/lastbackup
TMPFOLDER=sql/tmpbackup
ARCHIVEFOLDER=sql/archives


## SCRIPT PATH - [YOUR_MYSQLDUMP_COMMAND_PATH - In general : /usr/bin/mysqldump]
MYSQLDUMPPATH=/usr/bin/mysqldump

## DATEFORMAT - [YOUR DATE FORMAT - In General : %Y-%m-%d-%H-%M (Year-Month-Day-Hours-Minuts)]
DATEFORMAT=%Y-%m-%d-%H-%M

## MAX BACKUP STORED - [MAX_BACKUP_STORED - In General : 5]
MAXBACKUP=5