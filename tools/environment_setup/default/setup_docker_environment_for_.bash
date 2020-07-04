#!/bin/bash

# Docker Compose Vars
export MYSQL_ROOT_PASSWORD=somepassword
export DB_MOUNT=/var/dbs/dbName # simple defaults
export DB_BACKUP=/var/db_backups/dbName
export DB_XFER_DATA=/var/db_xfers/data_transfer.sql
export CONF_LOCATION=conf/
