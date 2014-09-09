#!/bin/sh


## DB
DBNAME=distilleriedusavoir_wp
DBUSER=userWp
DBPSWD=userWp

## FOLDER
LASTBACKUPFOLDER=sql/lastbackup
TMPFOLDER=sql/tmpbackup
ARCHIVEFOLDER=sql/archives
RESTOREDFOLDER=sql/lastrestored


## SCRIPT PATH
MYSQLDUMPPATH=/Applications/MAMP/Library/bin/mysqldump
MYSQLPATH=/Applications/MAMP/Library/bin/mysql

## DATEFORMAT
DATEFORMAT=%Y%m%d%H%M

## MAX BACKUP
MAXBACKUP=5
MAXRESTORE=5

