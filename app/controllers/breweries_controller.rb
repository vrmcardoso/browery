class BreweriesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @breweries = policy_scope(Brewery)
  end

  def index
    if params[:query].present?
      @breweries = policy_scope(Brewery.where("name ILIKE ?", "%#{params[:query]}%"))
      #@breweries = policy_scope(Brewery)
    else
      @breweries = policy_scope(Brewery.all)
    end
    @ranked_breweries = @breweries.order("rating DESC")
    @cheapest_breweries = @breweries.order("price ASC")
  end

  def show
    @brewery = Brewery.find(params[:id])
    @booking = Booking.new
    authorize @brewery

    @markers = [
      {
        lat: @brewery.latitude,
        lng: @brewery.longitude
      }
    ]
  end

  def new
    @brewery = Brewery.new
    authorize @brewery
  end

  def create
    @brewery = Brewery.new(brewery_params)
    @brewery.delivery = brewery_params[:delivery] == "1"
    @brewery.bottling = brewery_params[:bottling] == "1"
    @brewery.bottle_labeling = brewery_params[:bottle_labeling] == "1"

    @brewery.user = current_user
    authorize @brewery
    if @brewery.save
      redirect_to brewery_path(@brewery)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @brewery = Brewery.find(params[:id])
    authorize @brewery
  end

  def update
    @brewery = Brewery.find(params[:id])
    authorize @brewery
    @brewery.update(brewery_params)

    @brewery.delivery = brewery_params[:delivery] == "1"
    @brewery.bottling = brewery_params[:bottling] == "1"
    @brewery.bottle_labeling = brewery_params[:bottle_labeling] == "1"

    @brewery.save

    redirect_to brewery_path(@brewery)
  end

  def destroy
    @brewery = Brewery.find(params[:id])
    authorize @brewery
    @brewery.destroy

    redirect_to breweries_path, status: :see_other
  end

  private

  def brewery_params
    params.require(:brewery).permit(:name, :address, :description, :price, :size, :capacity, :rating, :delivery, :bottling, :bottle_labeling, photos: [])
  end

  def brewery_photo_param
    params.require(:brewery).permit(photos: [])
  end

end
