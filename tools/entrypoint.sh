#!/bin/bash

SERVERNAME="server"
USERNAME="sa"

/opt/mssql-tools/bin/sqlcmd -S $SERVERNAME \
    -U $USERNAME \
    -P "${SA_PASSWORD}" \
    -Q "CREATE DATABASE admin_bdd;"

/opt/mssql-tools/bin/sqlcmd -S $SERVERNAME \
    -U $USERNAME \
    -P "${SA_PASSWORD}" \
    -d "admin_bdd" \
    -i /seeds/LA300.sql
