# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'castles', id: :serial, force: :cascade do |t|
    t.string 'name', limit: 32, null: false
    t.integer 'prefecture', null: false
  end

  create_table 'prefectures', id: :serial, force: :cascade do |t|
    t.string 'name', limit: 32, null: false
    t.string 'name_en', limit: 32, null: false
  end

  add_foreign_key 'castles', 'prefectures', column: 'prefecture', name: 'castles_prefecture_fkey'
end
