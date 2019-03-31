class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.references :item, foreign_key: true
      t.integer :item_sub_id
      t.string :route
      t.string :name
      t.integer :walk_tima

      t.timestamps
    end
  end
end
