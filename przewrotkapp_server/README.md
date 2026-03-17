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

# UWAGA! Backupy mają pustą tabele serverpod_email_auth, żeby nie robić wycieków haseł :P
# Żeby działała musisz ją wypełnić:
psql -U przewrotkapp --command "INSERT INTO serverpod_email_auth (\"userId\", email, hash) SELECT id, email, 'dupa12' FROM serverpod_user_info ORDER BY id;" przewrotkapp
```
