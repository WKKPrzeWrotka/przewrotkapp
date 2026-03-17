#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

git pull
flutter build web --no-wasm-dry-run --output=/var/www/html/app.przewrotka.org/
