class RenameWalkTimaColumnToStations < ActiveRecord::Migration[5.0]
  def change
    rename_column :stations, :walk_tima, :walk_time
  end
end
