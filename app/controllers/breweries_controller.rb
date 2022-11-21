class BreweriesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @breweries = Brewerie.all
  end
end
