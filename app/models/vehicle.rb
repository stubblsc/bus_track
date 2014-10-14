class Vehicle < ActiveRecord::Base
  has_many :vehicle_locations, :dependent => :destroy

  after_create :create_vehicle_locations

  def create_vehicle_locations
    1.upto(1) do |num|
      vl = VehicleLocation.new("vehicle_id" => self.id, "route_id" => 1)
      vl.save
    end
  end
end
