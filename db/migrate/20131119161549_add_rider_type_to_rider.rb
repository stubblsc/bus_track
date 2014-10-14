class AddRiderTypeToRider < ActiveRecord::Migration
  def change
    add_column :riders, :riderType, :integer
  end
end
