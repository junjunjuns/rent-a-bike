class RentalsController < ApplicationController
  require 'bike_decorator'
  require 'rental_calculator'
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  # GET  /profiles/:profile_id/rentals
  def index
    @profile = Profile.find(params[:profile_id])
    @rentals = @profile.rental
  end

  # GET  /profiles/:profile_id/rentals/:id
  def show
    @profile = Profile.find(params[:profile_id])
    @rental = @profile.rental.find(params[:id])
  end

  # GET  /profiles/:profile_id/rentals/new
  def new
    @profile = Profile.find(params[:profile_id])
    @rental = @profile.rental.build
    @rental.profile_id = current_user.id
  end

  # GET /profiles/:profile_id/rentals/:id/edit
  def edit
    @profile = Profile.find(params[:profile_id])
    @rental = @profile.rental.find(params[:id])
  end

  # POST /profiles/:profile_id/rentals
  def create
    @profile = Profile.find(params[:rental][:profile_id])
    @rental = @profile.rental.build(params.require(:rental).permit!)
    @bike = Bike.find(@rental.bike_id)

    myBike = BasicBike.new(@bike.name, @bike.price, @bike.description)
    myCalculator = RentalCalculator.new(@rental.start_date, @rental.end_date)
    
    if params[:bike][:bag].to_s.length > 0 then
      myBike = SaddleBagDecorator.new(myBike)
    end

    if params[:bike][:stabiliser].to_s.length > 0 then
      myBike = StabiliserDecorator.new(myBike)
    end

    if params[:bike][:buggy].to_s.length > 0 then
      myBike = ChildBuggyDecorator.new(myBike)
    end

    if params[:bike][:seat].to_s.length > 0 then
      myBike = ChildSeatDecorator.new(myBike)
    end
  
    if params[:bike][:waterBag].to_s.length > 0 then
      myBike = WaterResistantBagDecorator.new(myBike)
    end

    if params[:bike][:eyeMirror].to_s.length > 0 then
      myBike = EyeMirrorDecorator.new(myBike)
    end

    if params[:bike][:bell].to_s.length > 0 then
      myBike = BellDecorator.new(myBike)
    end

    if params[:bike][:endMirror].to_s.length > 0 then
      myBike = EndMirrorDecorator.new(myBike)
    end

    if params[:bike][:horn].to_s.length > 0 then
      myBike = HornDecorator.new(myBike)
    end
    
    @rental.cost = myBike.cost + myCalculator.calculate
    @rental.description = myBike.details
    
    if @rental.save
      redirect_to profile_rental_url(@profile, @rental)
    else
      render :action => "new"
    end
  end

  # PATCH/PUT /profiles/:profile_id/rentals/:id
  def update
    @profile = Profile.find(params[:rental][:profile_id])
    @rental = Rental.find(params[:id])
    
    @bike = Bike.find(@rental.bike_id)

    myBike = BasicBike.new(@bike.name, @bike.price, @bike.description)
    myCalculator = RentalCalculator.new(@rental.start_date, @rental.end_date)
    
    if params[:bike][:bag].to_s.length > 0 then
      myBike = SaddleBagDecorator.new(myBike)
    end

    if params[:bike][:stabiliser].to_s.length > 0 then
      myBike = StabiliserDecorator.new(myBike)
    end

    if params[:bike][:buggy].to_s.length > 0 then
      myBike = ChildBuggyDecorator.new(myBike)
    end

    if params[:bike][:seat].to_s.length > 0 then
      myBike = ChildSeatDecorator.new(myBike)
    end
  
    if params[:bike][:waterBag].to_s.length > 0 then
      myBike = WaterResistantBagDecorator.new(myBike)
    end

    if params[:bike][:eyeMirror].to_s.length > 0 then
      myBike = EyeMirrorDecorator.new(myBike)
    end

    if params[:bike][:bell].to_s.length > 0 then
      myBike = BellDecorator.new(myBike)
    end

    if params[:bike][:endMirror].to_s.length > 0 then
      myBike = EndMirrorDecorator.new(myBike)
    end

    if params[:bike][:horn].to_s.length > 0 then
      myBike = HornDecorator.new(myBike)
    end
    
    @rental.cost = myBike.cost + myCalculator.calculate
    @rental.description = myBike.details
    
    if @rental.update_attributes(params.require(:rental).permit!)
      redirect_to profile_rental_url(@profile, @rental)
    else
      render :action => "edit"
    end
  end

  # DELETE  /profiles/:profile_id/rentals/:id
  def destroy
    @profile = Profile.find(params[:profile_id])
    @rental = Rental.find(params[:id])
    @rental.destroy
    
    respond_to do |format|
      format.html { redirect_to profile_rentals_path(@profile) }
      format.xml { head :ok }
    end
  end
  
  def allrentals
    @rentals = Rental.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_params
      params.require(:rental).permit(:start_date, :end_date, :cost, :description, :bike_id, :profile_id)
    end
end
