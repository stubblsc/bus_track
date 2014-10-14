class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.integer :currentBusID
      t.integer :currentRouteID

      t.timestamps
    end
  end
end
