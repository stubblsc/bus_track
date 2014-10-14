class ChangeRouteShapeType < ActiveRecord::Migration
  def self.up
    change_column :routes, :shape, :text, :limit =>16777215
  end

  def self.down
    change_column :routes, :shape, :text
  end
end
