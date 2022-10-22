#!/usr/bin/env bash

GREEN=$'\e[1;32m'
RED=$'\e[1;31m'
NC=$'\e[0m' # No Color

ROOT_FOLDER="${HOME}/ronitascrafts_com/"
BACKUP_1_FILE="${HOME}/chia/disks/chia-fd-1/ronitascrafts_com.bkp.tar.gz"
BACKUP_2_FILE="${HOME}/chia/disks/chia-fd-2/ronitascrafts_com.bkp.tar.gz"

echo "$(date) | ${GREEN}Starting backup${NC}"

if [[ -f "${BACKUP_1_FILE}" ]]; then
  echo "$(date) | ${GREEN}-> Moving ${BACKUP_1_FILE} to ${BACKUP_2_FILE}${NC}"
  mv "${BACKUP_1_FILE}" "${BACKUP_2_FILE}"
fi

cd "${ROOT_FOLDER}" || exit 1

echo "$(date) | ${GREEN}-> Backing up the code${NC}"
tar -zcf "/tmp/ronitascrafts_com__wordpress.tar.gz" "wordpress"

echo "$(date) | ${GREEN}-> Backing up the database${NC}"
source ".env" && docker-compose -f "${ROOT_FOLDER}/docker-compose.yml" -f "${ROOT_FOLDER}/docker-compose.override.yml" exec mariadb mysqldump -uroot -p"${MARIADB_ROOT_PASSWORD}" --all-databases > "/tmp/ronitascrafts_com__mariadb.sql"

echo "$(date) | ${GREEN}-> Creating final backup file${NC}"
cd "/tmp" || exit 1

tar -zcf "${BACKUP_1_FILE}" "ronitascrafts_com__wordpress.tar.gz" "ronitascrafts_com__mariadb.sql"

echo "$(date) | ${GREEN}-> Cleaning tmp files${NC}"
rm ronitascrafts_com__*

echo "$(date) | ${GREEN}Backup complete!${NC}"
