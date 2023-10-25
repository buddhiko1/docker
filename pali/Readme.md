### Warning 
  - Secrets file must with no line terminators.
    ```
    file email.txt`: ASCII text, with no line terminators
    ```
### Deploy
  - `rm -r _secrets`

### Setting
  - Set url of USER_INVITE_URL_ALLOW_LIST and PASSWORD_RESET_URL_ALLOW_LIST in the config.json.

### Postgres
  - Active psql with `psql -U admin -d pali`
  - Dump with `docker exec postgres pg_dump -U admin -d pali > pali.sql`
  - Import with `docker exec postgres psql -U admin -d pali < pali.sql`
