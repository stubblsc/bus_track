class ApiController < ApplicationController 

  def route
    if params[:id].to_s == "ALL"
      render json: Route.order(:name).where(enabled: true)
    else
      render json: Route.where("name = :name", {name: params[:id]}).where(enabled: true)
    end
  end

  def fullRouteInfo
    tmpRoute = Route.where("name = :name", {name: params[:id]}).first
    route = OpenStruct.new
    route.name = tmpRoute.name
    route.longname = tmpRoute.longname
    route.color = tmpRoute.color
    tl = Trip.where("route_id = :route_id", {route_id: tmpRoute.id})
    route.stops = []
    tl.each do |r|
      tmp = Stop.where("id = :id", {id: r.first_stop_id}).first
      route.stops << tmp
    end
    render text: route.to_json
  end

  def routeList
    routes = Route.order(:name).where(enabled: true).select([:name, :longName, :color])
    render text: routes.to_json
  end

  def phoneticList
    stops = Stop.find(:all, :select => "id, phonetic")
    render text: stops.to_json
  end

  def vehicleList
    vehicles = Vehicle.find(:all, :select => "busId")
    render text: vehicles.to_json
  end

  def vehiclesOnRoute
    vehicles = []
    if params[:id].to_s == "ALL"
      vl = VehicleLocation.where("updated_at > :minute", {minute: 5.minute.ago})
    else
      route = Route.where("name = :name", {name: params[:id]}).first
      vl = VehicleLocation.where("updated_at > :minute AND route_id = :route_id", {minute: 5.minute.ago, route_id: route.id})
    end
    
    vl.each do |r|
      tmp = { :vehicleId => Vehicle.find(r.vehicle_id).busId, :routeId => Route.find(r.route_id).name, :latitude => r.latitude, :longitude => r.longitude, :updated_at => r.updated_at }
      vehicles << tmp
    end
    render text: vehicles.to_json
  end

  def stopsOnRoute
    stops = []
    if params[:id].to_s == "ALL"
      sl = Stop.find(:all)
    else
      route = Route.where("name = :name", {name: params[:id]}).first
      tl = Trip.where("route_id = :route_id", {route_id: route.id}).all
      sl = []
      stop_descs = []
      freqs = []
      tl.each do |r|
        tmp = Stop.where("id = :id", {id: r.first_stop_id}).first
        sl << tmp
        my_tmp = r.polyline
	stop_descs << my_tmp
        my_other_tmp = r.distance
        freqs << my_other_tmp
      end
    end 
    i = 0
    sl.each do |r|
      tmp = { :id => r.id, :name => r.name, :stopsAt => stop_descs[i], :freq => freqs[i], :latitude => r.latitude, :longitude => r.longitude, :phonteic => r.phonetic }
      stops << tmp
      i = i+1
    end
    render text: stops.to_json
  end

  def updateVehiclePosition
    vehicle = Vehicle.where("busId = :vehicle", {vehicle: params[:vehicle]}).first
    vl = VehicleLocation.where("vehicle_id = :vehicle", {vehicle: vehicle.id}).order("updated_at DESC").first
    vl.route_id = Route.where("name = :name", {name: params[:route]}).first.id
    vl.latitude = params[:latitude]
    vl.longitude = params[:longitude]
    if vl.save
      render text: "OK"
    end
  end

  def updateDriverInfo
    driver = Driver.where("id = :id", {id: params[:id]}).first
    driver.currentBusID = params[:busId]
    driver.currentRouteID = params[:routeId]
    if driver.save
      render text: "OK"
    end
  end
  
  def addRiderEntry
    if Rider.create(:routeID => params[:routeID], :stopID => params[:stopID], :studentCount => params[:studentCount], :cashCount => params[:cashCount], :halfCount => params[:halfCount]).save
      render text: "OK"
    end
  end

  def tabletDriverList
    drivers = Driver.find(:all, :select => "id, name")
    render text: drivers.to_json
  end

  def tabletRouteList
    routes = Route.where(enabled: true).find(:all, :select => "id, name")
    render text: routes.to_json
  end

  def addMileageEntry
    lastMileage = Mileage.where(busId: params[:busId]).last
    temp = Mileage.new(:busId => params[:busId], :driverId => params[:driverId], :reason => params[:reason], :garage_out => params[:garage_out], :startMileage => params[:startMileage], :endMileage => params[:endMilage], :garage_in => params[:garage_in])
    if lastMileage.garage_in < temp.garage_out
      if Mileage.create(:busId => params[:busId], :driverId => params[:driverId], :reason => params[:reason], :garage_out => params[:garage_out], :startMileage => params[:startMileage], :endMileage => params[:endMileage], :garage_in => params[:garage_in]).save
        render text: "OK"
      end
    else
      render json:{error: "invalid data entry", status: 400}, status: 400
    end
  end

  def tripsForRoute
    #trips = Trip.where(route_id: params[:id]).select(:order, :first_stop_id, :second_stop_id, :time)
    trips = Trip.where(route_id: params[:route_id]).select(:first_stop_id, :second_stop_id, :time).order(order: :asc)
    render text: trips.to_json
  end

  def freqForRoute
    if params[:id].to_s == "ALL"
      render json: Frequency.order(:route_id)
    else
      tmpRoute = Route.where("name = :name", {name: params[:id]}).first
      render json: Frequency.where("route_id = :route_id", {route_id: tmpRoute.id})
    end 
  end

end
