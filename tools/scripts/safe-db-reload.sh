#!/usr/bin/env bash

SQL="SET group_concat_max_len = 10240;"
SQL="${SQL} SELECT GROUP_CONCAT(table_name separator ' ')"
SQL="${SQL} FROM information_schema.tables WHERE table_schema='$DB_NAME'"
SQL="${SQL} AND table_name IN ('account_ip_record', 'accounts', 'accounts_banned', 'auction_house', 'audit_chat',"
SQL="${SQL} 'audit_gm', 'bcnm_info', 'bot_variables', 'chars', 'char_blacklist', 'char_effects',"
SQL="${SQL} 'char_equip', 'char_exp', 'char_inventory', "
SQL="${SQL} 'char_jobs', 'char_look', 'char_merit', 'char_pet', 'char_points', 'char_profile',"
SQL="${SQL} 'char_recast', 'char_skills', 'char_spells', 'char_stats', 'char_storage',"
SQL="${SQL} 'char_style', 'char_unlocks', 'char_vars', 'conquest_system', 'delivery_box',"
SQL="${SQL} 'job_points', 'linkshells', 'server_variables');"

TBLIST=$(mysql -u $DB_USER -p$DB_USER_PASSWD -AN -e "${SQL}")

mysqldump $DB_NAME -u $DB_USER -p$DB_USER_PASSWD ${TBLIST} > instant_backup.sql

function run_scripts
{
  for f in $1*.sql
    do
      mysql $DB_NAME -u $DB_USER -p$DB_USER_PASSWD < $f && echo "Loaded $f"
    done
}

run_scripts "/init-scripts/"
# run_scripts "/init-scripts/qr_sql/" <put your custom sql loads here, if you have any>

mysql $DB_NAME -u root -p$MYSQL_ROOT_PASSWORD < instant_backup.sql
mysql $DB_NAME -u $DB_USER -p$DB_USER_PASSWD -e "UPDATE zone_settings SET zoneip='$EXTERNAL_IP';"
