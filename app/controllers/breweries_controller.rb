class BreweriesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @breweries = Brewery.all
    @breweries = policy_scope(Brewery)
  end

  def show
    authorize @brewery
  end

  def new
    @brewery = Brewery.new
    authorize @brewery
  end

  def create
    @brewery = Brewery.new(restaurant_params)
    @brewery.user = current_user
    authorize @brewery
  end

  def edit
    authorize @brewery
  end

  def update
    authorize @brewery
  end

  def destroy
    authorize @brewery
  end

end
