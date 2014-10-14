class MileagesController < ApplicationController
  before_action :set_mileage, only: [:show, :edit, :update, :destroy]

  # GET /mileages
  # GET /mileages.json
  def index
    @mileages = Mileage.order(:busId)
    
    respond_to do |f|
      f.html
      f.csv{send_data(@mileages.to_csv(:only => [:busId, :driverId, :reason, :garage_out, :startMileage, :endMileage, :garage_in]))}
      # f.csv{
      #   filename = "Mileages-#{Time.now.strftime("%Y%m%d%H%M%S")}.csv"
      #   send_data(@mileages.to_csv, :type => "text/csv; charset=utf-8; header=present", :filename => filename)
      # }
    end
  end

  def by_bus
    @mileages = Mileage.where(busId: params[:busId]).order(:created_at)

    respond_to do |f|
      f.html
      f.csv{send_data(@mileages.to_csv(:only => [:busId, :driverId, :reason, :garage_out, :startMileage, :endMileage, :garage_in]))}
      # f.csv{
      #   filename = "Mileages-#{Time.now.strftime("%Y%m%d%H%M%S")}.csv"
      #   send_data(@mileages.to_csv, :type => "text/csv; charset=utf-8; header=present", :filename => filename)
      # }
    end
  end

  def by_driver
    @mileages = Mileage.where(driverId: params[:driverId]).order(:created_at)

    respond_to do |f|
      f.html
      f.csv{send_data(@mileages.to_csv(:only => [:busId, :driverId, :reason, :garage_out, :startMileage, :endMileage, :garage_in]))}
      # f.csv{
      #   filename = "Mileages-#{Time.now.strftime("%Y%m%d%H%M%S")}.csv"
      #   send_data(@mileages.to_csv, :type => "text/csv; charset=utf-8; header=present", :filename => filename)
      # }
    end
  end

  # GET /mileages/1
  # GET /mileages/1.json
  def show
  end

  # GET /mileages/new
  def new
    @mileage = Mileage.new
  end

  # GET /mileages/1/edit
  def edit
  end

  # POST /mileages
  # POST /mileages.json
  def create
    @mileage = Mileage.new(mileage_params)

    respond_to do |format|
      if @mileage.save
        format.html { redirect_to @mileage, notice: 'Mileage was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mileage }
      else
        format.html { render action: 'new' }
        format.json { render json: @mileage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mileages/1
  # PATCH/PUT /mileages/1.json
  def update
    respond_to do |format|
      if @mileage.update(mileage_params)
        format.html { redirect_to @mileage, notice: 'Mileage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mileage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mileages/1
  # DELETE /mileages/1.json
  def destroy
    @mileage.destroy
    respond_to do |format|
      format.html { redirect_to mileages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mileage
      @mileage = Mileage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mileage_params
      params.require(:mileage).permit(:busId, :driverId, :reason, :startMileage, :endMileage, :garage_in, :garage_out)
    end
end
