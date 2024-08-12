# play_with_rails
Ruby on Railsを遊び尽くすリポジトリ

[![CI](https://github.com/koba-masa/play_with_rails/actions/workflows/ci.yaml/badge.svg)](https://github.com/koba-masa/play_with_rails/actions/workflows/ci.yaml)

## 開発環境構築手順
1. 事前準備を行う
   - Docker環境のRubyを使用する場合
      ```sh
      sh setup.sh docker
      ```
   - Local環境のRubyを使用する場合
      ```sh
      sh setup.sh local
      ```
1. Docker環境を構築する
   ```sh
   docker-compose build
   docker-compose up -d
   ```
1. Gemファイルをインストールする
   ```sh
   make install
   ```
1. DBを構築する
   ```sh
   make create
   make migrate
   make seed
   ```
1. サブシステム用のDDLとDMLを流し込む
   ```sh
   docker-compose exec db psql -U postgres -d sub_database_development -f /tmp/docker_files/sub_database.sql
   docker-compose exec db psql -U postgres -d sub_database_test -f /tmp/docker_files/sub_database.sql
   ```
1. Railsを起動する
- TODO
