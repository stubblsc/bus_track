class AddValueToFrequencies < ActiveRecord::Migration
  def change
    change_column :frequencies, :start_time, :time, :default => nil
  end
end
