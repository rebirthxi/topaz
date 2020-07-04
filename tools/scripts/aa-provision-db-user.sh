#!/usr/bin/env bash

function run_scripts
{
  for f in $1*.sql
    do
      mysql $DB_NAME -u $DB_USER -p$DB_USER_PASSWD < $f && echo "Loaded $f"
    done
}

echo "Creating Database $DB_NAME"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE $DB_NAME;"

echo "Creating User ($DB_USER) for $DB_NAME"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWD';"

echo "Granting Appropriate priviledges on $DB_NAME to $DB_USER"
mysql $DB_NAME -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"

run_scripts "/init-scripts/"
# run_scripts "/init-scripts/qr_sql/" <put your custom sql scripts here, if you ahve any>

echo "Setting IP Address: $EXTERNAL_IP"
mysql $DB_NAME -u $DB_USER -p$DB_USER_PASSWD -e "UPDATE zone_settings SET zoneip='$EXTERNAL_IP';"

exit 1
