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
  end

  def edit
    authorize @brewery
    @brewery = Brewery.find(params[:id])
  end

  def update
    authorize @brewery
  end

  def destroy
    authorize @brewery
  end

  private

  def brewery_params
    params.require(:bookmark).permit(:comment, :movie_id,)
  end

end
