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
    authorize @brewery
    @brewery = Brewery.find(params[:id])
  end

  def update
    @brewery = Brewery.fing(params[:id])
    authorize @brewery
    @brewery.update(brewery_params)
    @brewery.user = current_user

    redirect_to breweries_path
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

end
