class CreateMileages < ActiveRecord::Migration
  def change
    create_table :mileages do |t|
      t.integer :busId
      t.integer :driverId
      t.string :reason
      t.integer :startMileage
      t.integer :endMileage

      t.timestamps
    end
  end
end
