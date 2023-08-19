# play_with_rails
Ruby on Railsを遊び尽くすリポジトリ

## 開発環境構築手順

### Docker環境のRubyを使用する場合
1. Makefileをコピーする
   ```sh
   cp makefiles/Makefile.docker Makefile
   ```
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
   docker-compose exec app bundle exec rails db:create
   docker-compose exec app bundle exec rails db:migrate:main_system
   docker-compose exec app bundle exec rails db:seed
   docker-compose exec app bundle exec rails db:migrate:main_system RAILS_ENV=test
   ```
1. サブシステム用のDDLとDMLを流し込む
   ```sh
   docker-compose exec db psql -U postgres -d sub_database -f /tmp/docker_files/sub_database.sql
   ```

### ローカル環境のRubyを使用する場合
1. Makefileをコピーする
   ```sh
   cp makefiles/Makefile.local Makefile
   ```
1. .envrcをコピーする
   ```sh
   cp .envrc.sample .envrc
   ```
1. Docker環境を構築する
   ```sh
   docker-compose -f compose.local.yml build
   docker-compose -f compose.local.yml up -d
   ```
1. Gemファイルの更新を行う
   ```sh
   bundle install
   ```
1. データベースを構築する
   ```sh
   bundle exec rails db:create
   bundle exec rails db:migrate:main_system
   bundle exec rails db:seed
   bundle exec rails db:migrate:main_system RAILS_ENV=test
   ```
1. サブシステム用のDDLとDMLを流し込む
   ```sh
   docker-compose exec db psql -U postgres -d sub_database -f /tmp/docker_files/sub_database.sql
   ```
1. Railsを起動する
   ```sh
   bundle exec rails s -p 3000 -b '0.0.0.0'
   ```
