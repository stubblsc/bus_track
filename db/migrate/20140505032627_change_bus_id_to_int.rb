class ChangeBusIdToInt < ActiveRecord::Migration
  def change
    change_column :vehicles, :busId, :integer
  end
end
