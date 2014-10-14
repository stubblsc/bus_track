class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :route_id
      t.integer :order
      t.integer :first_stop_id
      t.integer :second_stop_id
      t.text :polyline, :limit =>16384
      t.decimal :distance, :precision => 10, :scale => 6
      t.integer :time

      t.timestamps
    end
  end
end
