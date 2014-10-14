class AddPhoneticToStops < ActiveRecord::Migration
  def change
    add_column :stops, :phonetic, :string
  end
end
