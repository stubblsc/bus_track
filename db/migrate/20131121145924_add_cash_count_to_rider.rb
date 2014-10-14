class AddCashCountToRider < ActiveRecord::Migration
  def change
    add_column :riders, :cashCount, :integer
  end
end
