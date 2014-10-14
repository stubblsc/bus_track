class AddCountToRider < ActiveRecord::Migration
  def change
    add_column :riders, :count, :integer
  end
end
