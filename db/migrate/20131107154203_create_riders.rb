class CreateRiders < ActiveRecord::Migration
  def change
    create_table :riders do |t|
      t.integer :riderType
      t.string :count
      t.string :integer
      t.integer :routeID
      t.integer :stopID

      t.timestamps
    end
  end
end
