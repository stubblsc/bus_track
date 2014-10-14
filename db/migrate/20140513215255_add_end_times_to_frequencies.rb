class AddEndTimesToFrequencies < ActiveRecord::Migration
  def change
    add_column :frequencies, :end_time, :Time
  end
end
