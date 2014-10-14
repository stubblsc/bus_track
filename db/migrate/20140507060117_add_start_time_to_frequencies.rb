class AddStartTimeToFrequencies < ActiveRecord::Migration
  def up
    add_column :frequencies, :start_time, :time
  end

  def down
    delete_column :frequencies, :start_time
  end
end
