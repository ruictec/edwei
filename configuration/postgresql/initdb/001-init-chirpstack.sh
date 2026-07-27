#!/bin/bash
set -e

# When POSTGRES_USER / POSTGRES_DB are already set to chirpstack
# (see docker-compose.yml), the role and database already exist.
# Only create them when bootstrapping with a different superuser.
if [ "$POSTGRES_USER" != "chirpstack" ]; then
	psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
		create role chirpstack with login password 'chirpstack';
		create database chirpstack with owner chirpstack;
	EOSQL
fi
