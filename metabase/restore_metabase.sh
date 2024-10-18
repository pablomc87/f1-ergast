#!/bin/bash

# Restore PostgreSQL data
docker compose exec -T postgres_metabase pg_restore -U metabase -d metabase -c < metabase/metabase_backup.dump