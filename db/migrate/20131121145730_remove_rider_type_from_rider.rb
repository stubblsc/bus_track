class RemoveRiderTypeFromRider < ActiveRecord::Migration
  def change
    remove_column :riders, :riderType, :integer
  end
end
