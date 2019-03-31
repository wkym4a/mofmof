class ChangeColumnBanNull < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :name, :string, null: false
  end
end
