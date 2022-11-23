class BreweriesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @breweries = policy_scope(Brewery)
  end

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
    @brewery.delivery = brewery_params[:delivery] == "1"
    @brewery.bottling = brewery_params[:bottling] == "1"
    @brewery.bottle_labeling = brewery_params[:bottle_labeling] == "1"

    @brewery.user = current_user
    authorize @brewery
    @brewery.save

    redirect_to brewery_path(@brewery)
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
