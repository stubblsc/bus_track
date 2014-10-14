class RemoveIntegerFromRider < ActiveRecord::Migration
  def change
    remove_column :riders, :integer, :string
  end
end
