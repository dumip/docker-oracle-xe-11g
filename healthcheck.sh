#!/bin/bash

export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export PATH=$ORACLE_HOME/bin:$PATH
export ORACLE_SID=XE
export ORACLE_DATA=/u01/app/oracle/oradata/$ORACLE_SID

RETVAL=`sqlplus -silent sys/${ORACLE_PASSWORD} as sysdba <<EOF
SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
SELECT 'Alive' FROM dual;
EXIT;
EOF`

echo $RETVAL

if [ "${RETVAL}" = "Alive" ]; then
  exit 0;
else
  exit 1;
fi