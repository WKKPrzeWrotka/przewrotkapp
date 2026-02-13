# Jak se zrobić baze dev?

```bash
# Zrób se usera takiego jak ma serwer (ułatwia przywracanie backupów):
psql -U postgres --command "CREATE ROLE przewrotkapp WITH login createdb;" postgres
# Stwórz bazke:
createdb -U przewrotkapp przewrotkapp
# Tu już można odpalać server
cd projekciki/przewrotkapp/przewrotkapp_server
dart run bin/main.dart --apply-migrations
# ...albo, przywrócić sobie z backupu:
pg_restore -d przewrotkapp --clean Downloads/twojBackup.dump
```
