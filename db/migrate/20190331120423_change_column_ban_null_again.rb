class ChangeColumnBanNullAgain < ActiveRecord::Migration[5.0]
  def change
      change_column :items, :name, :string, null: false
      change_column :items, :address, :string, null: false
      change_column :items, :matter, :text, null: false

      change_column :stations, :route, :string, null: false
      change_column :stations, :name, :string, null: false
  end
end
