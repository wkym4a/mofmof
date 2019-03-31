class RechangeColumnBanNull < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :name, :string, null: true
      change_column :items, :address, :string, null: true
      change_column :items, :matter, :text, null: true

      change_column :stations, :route, :string, null: true
      change_column :stations, :name, :string, null: true
  end
end
