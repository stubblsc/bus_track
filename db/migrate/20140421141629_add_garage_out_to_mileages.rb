class AddGarageOutToMileages < ActiveRecord::Migration
  def change
    add_column :mileages, :garage_out, :int
  end
end
