#!/bin/sh

# launch to : sh restore.sh [TYPEOFRESTORE]
# TYPEOFRESTORE : preprodtodev - devtopreprod

SCRIPT_NAME=$(basename $0)

source config.sh

echo "[==== STEP 1/4] Add folder if not exists (${RESTOREDFOLDER})";
mkdir -p ${RESTOREDFOLDER};

NAMEOFFILE=( $(find ${TMPFOLDER} -type f -name "*.sql" ) )

## Restore database to .sql file
echo "[==== STEP 2/4] Begin restore database (${DBNAME}) from this path : ${NAMEOFTARFILE}";
${MYSQLPATH} -u${DBUSER} -p${DBPSWD} ${DBNAME} < ${NAMEOFFILE}

## Copy restored file to RESTOREDFOLDER
echo "[==== STEP 3/4] Copy restored file to ${RESTOREDFOLDER}";
cp -pR ${NAMEOFFILE} ${RESTOREDFOLDER};

##find ${ARCHIVEFOLDER}/ -type f -mtime +${MAXDAYBACKUP} -delete
echo "[==== STEP 4/4] Keep ${MAXRESTORE} file(s) and delete others";
find ${RESTOREDFOLDER} -maxdepth 1 -type f | xargs ls -t | awk 'NR>'${MAXRESTORE} | xargs rm -rf
