#!/bin/bash

BACKUP_DIR="/backup"
LOG_FILE="/var/log/backup.log"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_${TIMESTAMP}.tar.gz"

mkdir -p "$BACKUP_DIR"

log() {
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] $1" | sudo tee -a "$LOG_FILE"
}

log "Starting backup..."

if [ -f .env ]; then
    source .env
else
    log "ERROR: .env file not found."
    exit 1
fi

DUMP_FILE="/tmp/odoo_dump_${TIMESTAMP}.sql"
docker exec odoo_db pg_dump -U "$POSTGRES_USER" "$POSTGRES_DB" > "$DUMP_FILE"
if [ $? -ne 0 ]; then log "ERROR: pg_dump failed"; exit 1; fi
log "Database dumped."

TEMP_DIR="/tmp/backup_${TIMESTAMP}"
mkdir -p "$TEMP_DIR"
cp "$DUMP_FILE" "$TEMP_DIR/database.sql"
docker cp odoo_app:/var/lib/odoo "$TEMP_DIR/filestore"
if [ $? -ne 0 ]; then log "ERROR: docker cp filestore failed"; exit 1; fi
log "Filestore copied."

tar -czf "$BACKUP_FILE" -C "$TEMP_DIR" .
rm -rf "$TEMP_DIR" "$DUMP_FILE"
log "Backup created: $BACKUP_FILE"
