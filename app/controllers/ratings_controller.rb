class RatingsController < ApplicationController
  def new
    @rating = Rating.new
    authorize @rating
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    authorize @rating

    if @rating.save
      breweries_path(Brewery.find(params[:brewery_id]))
    else
      render new, status: :unprocessable_entity
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:brewery_id, :stars)
  end

end
