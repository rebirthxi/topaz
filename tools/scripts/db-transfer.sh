#!/usr/bin/env bash

mysql $DB_NAME -u $DB_LOGIN -p$DB_PASSWD < /var/db_xfer/data_transfer.sql
mysql $DB_NAME -u $DB_LOGIN -p$DB_PASSWD -e "UPDATE zone_settings SET zoneip='$EXTERNAL_IP';"
