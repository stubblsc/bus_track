class RidersController < ApplicationController
  before_action :set_rider, only: [:show, :edit, :update, :destroy]

  # GET /riders
  # GET /riders.json
  def index
    if params[:start_date] and params[:end_date]
      @riders = Rider.where(:created_at => params[:start_date]..params[:end_date])
    else
      @riders = Rider.all
    end
    
    respond_to do |format|
      format.html
      format.csv{send_data(@riders.to_csv)}
    end
  end

  # GET /riders/1
  # GET /riders/1.json
  def show
  end

  # GET /riders/new
  def new
    @rider = Rider.new
  end

  # GET /riders/1/edit
  def edit
  end

  # POST /riders
  # POST /riders.json
  def create
    @rider = Rider.new(rider_params)

    respond_to do |format|
      if @rider.save
        format.html { redirect_to @rider, notice: 'Rider was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rider }
      else
        format.html { render action: 'new' }
        format.json { render json: @rider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /riders/1
  # PATCH/PUT /riders/1.json
  def update
    respond_to do |format|
      if @rider.update(rider_params)
        format.html { redirect_to @rider, notice: 'Rider was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /riders/1
  # DELETE /riders/1.json
  def destroy
    @rider.destroy
    respond_to do |format|
      format.html { redirect_to riders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rider
      @rider = Rider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rider_params
      params.require(:rider).permit(:routeID, :stopID, :studentCount, :cashCount, :halfCount)
    end
end
