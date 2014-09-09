Na Backup DB
============

This script was created by Nicolas AGUENOT (<contact@nicolasaguenot.com>).

This main utility is to backup database in terms of information provided on config.sh file

---------------------------------------

Config
------

Rename config_sample.sh to config.sh

    mv config_sample.sh config.sh

Register your informations on config.sh file like this :


    ## DB
    DBNAME=[YOUR_DATABASE_NAME]
    DBUSER=[YOUR_DATABASE_USER]
    DBPSWD=[YOUR_DATABASE_PASSWORD]

    ## FOLDER
    LASTBACKUPFOLDER=sql/lastbackup
    TMPFOLDER=sql/tmpbackup
    ARCHIVEFOLDER=sql/archives
    RESTOREDFOLDER=sql/lastrestored

    ## SCRIPT PATH
    MYSQLDUMPPATH=[YOUR_MYSQLDUMP_COMMAND_PATH - In general : /usr/bin/mysqldump]

    ## DATEFORMAT
    DATEFORMAT=[YOUR DATE FORMAT - In General : %Y-%m-%d-%H-%M (Year-Month-Day-Hours-Minuts)]

    ## MAX BACKUP STORED - [MAXBACKUP - In General : 5]
    MAXBACKUP=5

    ## MAX RESTORED BACKUP - [MAXRESTORE - In General : 5]
    MAXRESTORE=5

---------------------------------------

How to dump my database ?
------------

Open terminal and come to nabackupdb directory.
After configurating your config.sh file, launch this command :

    sh backup.sh

And It works !

---------------------------------------

How to restore my latest dumped database ?
------------

Open terminal and come to nabackupdb directory.
After configurating your config.sh file, launch this command :

    sh restore.sh

And It works !


Different directory
------------

A directory sql is created with 3 sub-directory :

### archives/

containing previous backup

### lastbackup/

containing latest backup.

when you relaunch the script, this backup will be move to archives/ directory.

### lastrestored/

containing lastest restored file on sql format.


### tmpbackup/

containing lastest backup on sql format.

when you relaunch the script, this file will be replaced by newest sql file backup.


