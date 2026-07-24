#!/usr/bin/env bash
set -e

# Remove a stale Rails server PID left by an interrupted shutdown.
rm -f /app/tmp/pids/server.pid

echo "Waiting for MariaDB..."

until mariadb-admin ping \
  --host="${DATABASE_HOST:-db}" \
  --user="${DATABASE_USER:-redmine}" \
  --password="${DATABASE_PASSWORD:-redmine_dev}" \
  --silent; do
  sleep 2
done

echo "MariaDB is available."

bundle exec rails db:prepare

exec "$@"
