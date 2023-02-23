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
   docker-compose run --rm app bundle exec rails db:migrate
   docker-compose run --rm app bundle exec rails db:seed
   docker-compose run --rm app bundle exec rails db:migrate RAILS_ENV=test
   ```
