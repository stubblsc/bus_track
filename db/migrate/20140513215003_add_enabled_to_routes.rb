class AddEnabledToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :enabled, :boolean
  end
end
