#!/usr/bin/env sh

export POSTGRES_PORT="${POSTGRES_PORT:-5432}"
export DATABASE_URL="postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:$POSTGRES_PORT/${POSTGRES_DB}"

RETRIES=10
PASSFILE=$HOME/.pgpass
echo "*:*:*:$POSTGRES_USER:$POSTGRES_PASSWORD" > $PASSFILE
chmod 0600 $PASSFILE

until PGPASSFILE=$PASSFILE psql -lqt -h $POSTGRES_HOST -p $POSTGRES_PORT -U $POSTGRES_USER -d $POSTGRES_DB > /dev/null 2>&1 || [ $RETRIES -eq 0 ]; do
  echo "Waiting for database server, $RETRIES remaining attempts ..."
  RETRIES=$((RETRIES-=1))
  sleep 5
done

poetry run ./manage.py runserver 0.0.0.0:8000
