class BookingsController < ApplicationController
  def create
    @brewery = Brewery.find(params[:brewery_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.brewery = @brewery
    @booking.end_date = params[:booking][:start_date].split[2]
    authorize @booking

    if @booking.save
      redirect_to brewery_path(@brewery), notice: "Booking was sucessfully created"
    else
      render "breweries/show", status: :unprocessable_entity
    end
  end

  def rate
    @booking = Booking.find(params[:id])

  end

  private

  def booking_params
    params.require(:booking).permit(:brewery_id, :start_date, :end_date)
  end

  def rating_params
    params.require(:booking).permit(:rating)
  end
end
