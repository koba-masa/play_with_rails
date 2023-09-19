class AddKokushiToDaimyos < ActiveRecord::Migration[6.0]
  def up
    add_column :daimyos, :kokushi, :string, limit: 16, null: true, comment: '国司'
  end

  def down
    remove_column :daimyos, :kokushi
  end
end
