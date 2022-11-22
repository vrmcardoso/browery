class BreweriesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @breweries = policy_scope(Brewery)
  end

  def show
    @brewery = Brewery.find(params[:id])
    authorize @brewery
  end

  def new
    @brewery = Brewery.new
    authorize @brewery
  end

  def create
    @brewery = Brewery.new(brewery_params)
    @brewery.user = current_user
    authorize @brewery
    @brewery.save

    redirect_to breweries_path
  end

  def edit
    @brewery = Brewery.find(params[:id])
    authorize @brewery
  end

  def update
    @brewery = Brewery.find(params[:id])
    authorize @brewery
    @brewery.update(brewery_params)

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
    params.require(:brewery).permit(:name, :address, :description, :price, :size, :capacity, :rating, photos: [])
  end

  def brewery_photo_param
    params.require(:brewery).permit(photos: [])
  end

end
