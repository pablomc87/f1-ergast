#!/bin/bash

# Backup PostgreSQL data
docker compose exec -t postgres_metabase pg_dump -U metabase -Fc metabase > metabase/metabase_backup.dump
