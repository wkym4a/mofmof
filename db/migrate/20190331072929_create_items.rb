class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :rent_price
      t.string :address
      t.integer :age
      t.text :matter

      t.timestamps
    end
  end
end
