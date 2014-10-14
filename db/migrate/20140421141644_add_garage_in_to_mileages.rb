class AddGarageInToMileages < ActiveRecord::Migration
  def change
    add_column :mileages, :garage_in, :int
  end
end
