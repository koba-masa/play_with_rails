# 同一テーブルに対して複数の外部キーを設定する

## 概要
- 以下のような関係性を実現したい
  ```sql
  CREATE TABLE users(
      id SERIAL PRIMARY KEY
    , name VARCHAR(255)
  );
  CREATE TABLE samples(
      id SERIAL PRIMARY KEY
    , user1 INT
    , user2 INT
    , CONSTRAINT fk_user1_users FOREIGN KEY (user1) REFERENCES users (id)
    , CONSTRAINT fk_user2_users FOREIGN KEY (user2) REFERENCES users (id)
  )
  ```

## 方法
```ruby
def change
  create_table :samples do |t|
    t.references :user1, null: false, foreign_key: { to_table: :user }
    t.references :user2, null: false, foreign_key: { to_table: :user }

    t.timestamps
  end
end
```
