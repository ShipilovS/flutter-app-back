#!/bin/sh
echo "Migrating the database before starting the server"
export RAILS_ENV="test"
rails db:prepare
echo "Generate Swagger"
rails rswag
export RAILS_ENV="production"
exec "$@"