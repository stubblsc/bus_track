class AddStudentCountToRider < ActiveRecord::Migration
  def change
    add_column :riders, :studentCount, :integer
  end
end
