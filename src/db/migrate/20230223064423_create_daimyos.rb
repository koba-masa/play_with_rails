# frozen_string_literal: true

class CreateDaimyos < ActiveRecord::Migration[6.0]
  def change
    create_table :daimyos do |t|
      t.string :name, limit: 64, null: false, comment: '名前'
      t.date :birthed_on, comment: '生年月日'
      t.date :died_on, comment: '没年月日'

      t.timestamps
    end
  end
end
