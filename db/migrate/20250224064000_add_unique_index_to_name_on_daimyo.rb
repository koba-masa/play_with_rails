# frozen_string_literal: true

class AddUniqueIndexToNameOnDaimyo < ActiveRecord::Migration[6.0]
  def change
    add_index :daimyos, :name, unique: true
  end
end
