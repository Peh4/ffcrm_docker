#!/bin/bash
set -e

set_config() {
  key="$1"
  value="$2"
  sed_escaped_value="$(echo $value | sed 's/[\/&]/\\&/g')"
  sed "s/$key/$key\ $sed_escaped_value/g" /home/ffcrm/config/database.postgres.docker.yml > /home/ffcrm/config/database.yml
  rake db:create
}

if [ $DB_PASS ]; then
  set_config 'password:' "$DB_PASS"  
else
  echo "ERROR : set a password -e 'DB_PASS=***'"
fi

cd /home/ffcrm/bin

#run the Dockerfile CMD ["rails server"]
exec "$@"