class ChangeBusIdToInteger < ActiveRecord::Migration
  def self.up
    change_column :vehicles, :busId, :integer
  end
end
