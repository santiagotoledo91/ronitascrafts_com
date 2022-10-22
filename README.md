### Setup

- Make a copy of `docker-compose.override.example.yml` named `docker-compose.override.yml`
- Set the secrets
- Make a copy of `.env.example` named `.env`
- Set the secrets
- run `docker-compose up -d`

### Set up the crons
- Open the crontab
  ```shell
  crontab -e
  ```
- Add the following entries
  ```shell
  0 6 * * * ~/ronitascrafts_com/backup.sh >> ~/ronitascrafts_com/backup.log 2>&1
  ```
