class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET  /bikes/:bike_id/reviews
  def index
    @bike = Bike.find(params[:bike_id])
    @reviews = @bike.review
  end

  # GET  /bikes/:bike_id/reviews/:id
  def show
    @bike = Bike.find(params[:bike_id])
    @review = @bike.review.find(params[:id])
  end

  # GET  /bikes/:bike_id/reviews/new
  def new
    @bike = Bike.find(params[:bike_id])
    @review = @bike.review.build
    @review.profile_id = current_user.id
  end

  # GET /bikes/:bike_id/reviews/:id/edit
  def edit
    @bike = Bike.find(params[:bike_id])
    @review = @bike.review.find(params[:id])
  end

  # POST /bikes/:bike_id/reviews
  def create
    @bike = Bike.find(params[:review][:bike_id])
    @review = @bike.review.build(params.require(:review).permit!)
    #@review = @bike.review.build(params.require(:review).permit(:profile_id, :feedback, :rating))
    
    if @review.save
      redirect_to bike_review_url(@bike, @review)
    else
      render :action => "new"
    end
  end

  # PATCH/PUT  /bikes/:bike_id/reviews/:id
  def update
    @bike = Bike.find(params[:review][:bike_id])
    @review = Review.find(params[:id])
    if @review.update_attributes(params.require(:review).permit!)
      redirect_to bike_review_url(@bike, @review)
    else
      render :action => "edit"
    end
  end

  # DELETE  /bikes/:bike_id/reviews/:id
  def destroy
    @bike = Bike.find(params[:bike_id])
    @review = Review.find(params[:id])
    @review.destroy
    
    respond_to do |format|
      format.html { redirect_to bike_reviews_path(@bike) }
      format.xml { head :ok }
    end
  end
  
  def allreviews
    @reviews = Review.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:feedback, :rating, :bike_id, :profile_id)
    end
end
