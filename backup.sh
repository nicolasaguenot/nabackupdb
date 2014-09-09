#!/bin/sh
SCRIPT_NAME=$(basename $0)

source config.sh

echo "[==== STEP 1/6] Add folders if not exists (${LASTBACKUPFOLDER}, ${TMPFOLDER}, ${ARCHIVEFOLDER})";
mkdir -p ${LASTBACKUPFOLDER};
mkdir -p ${TMPFOLDER};
mkdir -p ${ARCHIVEFOLDER};

## Move tar.gz file to Archive folder
echo "[==== STEP 2/6] Move *.tar.gz archive to ${ARCHIVEFOLDER}";
mv ${LASTBACKUPFOLDER}"/"*.tar.gz ${ARCHIVEFOLDER}"/";

## Delete all uncompress file to tmp foldeer
echo "[==== STEP 3/6] Remove all uncompress file to ${TMPFOLDER}";
rm ${TMPFOLDER}"/"${DBNAME}_`date +"*"`.sql


## Dump database to .sql file
echo "[==== STEP 4/6] Begin dump database (${DBNAME}) to this path : ${TMPFOLDER}"/"${DBNAME}_`date +"${DATEFORMAT}"`.sql";
${MYSQLDUMPPATH} -u${DBUSER} -p${DBPSWD} ${DBNAME} > ${TMPFOLDER}"/"${DBNAME}_`date +"${DATEFORMAT}"`.sql


## Compress dump database
echo "[==== STEP 5/6] Compress dump database (${DBNAME}) to this path : ${LASTBACKUPFOLDER}"/"${DBNAME}_`date +"${DATEFORMAT}"`.sql";
tar cvf ${LASTBACKUPFOLDER}"/"${DBNAME}_`date +"${DATEFORMAT}"`.sql.tar.gz ${TMPFOLDER}"/"${DBNAME}_`date +"${DATEFORMAT}"`.sql

##find ${ARCHIVEFOLDER}/ -type f -mtime +${MAXDAYBACKUP} -delete
echo "[==== STEP 6/6] Keep ${MAXBACKUP} archive(s) and delete others";
find ${ARCHIVEFOLDER} -maxdepth 1 -type f | xargs ls -t | awk 'NR>'${MAXBACKUP} | xargs rm -rf
