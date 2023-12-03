function pull_db_from_heroku_app_to_local {
  # $1 app-name
  # $2 local-db-name
  if [ ! $# -ge 2 ]
    then echo "please supply args 'heroku-app-name' and 'local-postgres-db-name'"
  else
    dropdb $2
    heroku pg:pull DATABASE_URL $2 -a $1
  fi
}

function promote_db_table_from_heroku_app_to_heroku_app {
  # $1 source-heroku-app-name
  # $2 target-heroku-app-name
  # $3 table-name
  if [ ! $# -ge 3 ]
    then echo "please supply args. example: 'source-heroku-app-name target-heroku-app-name table1 table2 table3'"
  else
    local source_db_connection_string=`heroku pg:credentials:url -a $1 | egrep -o 'postgres\:\/\/\S+'`
    local target_db_connection_string=`heroku pg:credentials:url -a $2 | egrep -o 'postgres\:\/\/\S+'`
    local truncate_tables_string=`echo "${@:3}" | sed 's/ /,/g'`
    local pg_dump_tables_string=''
    for arg in ${@:3}
    do
      pg_dump_tables_string+=('-t')
      pg_dump_tables_string+=("$arg")
    done
    echo "psql -d $target_db_connection_string -c 'truncate $truncate_tables_string'; pg_dump --data-only --column-inserts $source_db_connection_string $pg_dump_tables_string | psql -d $target_db_connection_string"
  fi
}

function reset_heroku_database_from_latest_backup {
  # $1 heroku-app-name
  heroku pg:backups:capture -a $1

  # since this is a relatively destructive feature needing eyes on it, just print the commands
  local latest_backup=`heroku pg:backups --app $1 | grep -i completed | egrep -m1 -o '^b\d+'`
  echo "** NOTE: reset the db if the backup was successful"
  echo "heroku pg:reset DATABASE --app $1"
  echo "** NOTE: wait a few seconds and verify the reset shows read/write mode again"
  echo "heroku pg:info --app $1"
  echo "** NOTE: once its clear, double check the backup id matches the backup just created and restore the data."
  echo "heroku pg:backups:restore $latest_backup DATABASE_URL --app $1"
  echo "** NOTE: restart the app"
  echo "heroku ps:restart --app $1"
}
