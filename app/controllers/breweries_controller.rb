class BreweriesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @breweries = Brewery.all
  end
end
