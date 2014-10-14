class RemoveCountFromRider < ActiveRecord::Migration
  def change
    remove_column :riders, :count, :integer
  end
end
