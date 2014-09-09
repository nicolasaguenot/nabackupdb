#!/bin/sh

# launch to : sh restore.sh [TYPEOFRESTORE]
# TYPEOFRESTORE : preprodtodev - devtopreprod

SCRIPT_NAME=$(basename $0)

source config.sh

echo "[==== STEP 1/3] Add folder if not exists (${RESTOREDFOLDER})";
mkdir -p ${RESTOREDFOLDER};

NAMEOFFILE=( $(find ${TMPFOLDER} -type f -name "*.sql" ) )

## Restore database to .sql file
echo "[==== STEP 2/3] Begin restore database (${DBNAME}) from this path : ${NAMEOFTARFILE}";
${MYSQLPATH} -u${DBUSER} -p${DBPSWD} ${DBNAME} < ${NAMEOFFILE}

## Copy restored file to RESTOREDFOLDER
echo "[==== STEP 3/3] Copy restored file to ${RESTOREDFOLDER}";
cp -pR ${NAMEOFFILE} ${RESTOREDFOLDER};
