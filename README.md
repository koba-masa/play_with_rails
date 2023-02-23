# play_with_rails
Ruby on Railsを遊び尽くすリポジトリ

## 開発環境構築手順
1. Docker環境を構築する
   ```sh
   docker-compose build
   docker-compose up
   ```
1. Gemファイルの更新を行う
   ```sh
   docker-compose run --rm app bundle install
   ```
1. データベースを構築する
   ```sh
   docker-compose run --rm app bundle exec rails db:create
   ```
1. サブシステム用のDDLとDMLを流し込む
   ```sh
   docker-compose exec db psql -U postgres -d sub_database -f /tmp/docker_files/sub_database.sql
   ```