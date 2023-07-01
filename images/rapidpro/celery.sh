#!/usr/bin/env sh

export CELERY_REDIS_SCHEDULER_URL="$REDIS_URL/10"
export CELERY_REDIS_SCHEDULER_KEY_PREFIX="tasks:meta:"
export POSTGRES_PORT="${POSTGRES_PORT:-5432}"
export DATABASE_URL="postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:$POSTGRES_PORT/${POSTGRES_DB}"

RETRIES=30
PASSFILE=$HOME/.pgpass
echo "*:*:*:$POSTGRES_USER:$POSTGRES_PASSWORD" > $PASSFILE
chmod 0600 $PASSFILE

until PGPASSFILE=$PASSFILE psql -lqt -h $POSTGRES_HOST -p $POSTGRES_PORT -U $POSTGRES_USER -d $POSTGRES_DB > /dev/null 2>&1 || [ $RETRIES -eq 0 ]; do
  echo "Waiting for database server, $RETRIES remaining attempts ..."
  RETRIES=$((RETRIES-=1))
  sleep 5
done

poetry run celery -A temba worker --beat -l debug -Q flows,msgs,handler,celery -c 2 -S celerybeatredis.schedulers.RedisScheduler
