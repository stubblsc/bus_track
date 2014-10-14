class AddHalfCountToRider < ActiveRecord::Migration
  def change
    add_column :riders, :halfCount, :integer
  end
end
