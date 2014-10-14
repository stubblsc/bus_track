class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.string :longname
      t.string :color
      t.string :shape

      t.timestamps
    end
  end
end
