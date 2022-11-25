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
    @bookings = Booking.all
    @booking = Booking.find(params[:id])
    @booking.update(rating_params)
    @brewery = Brewery.find(@booking.brewery_id)
    authorize @booking
    sum = 0
    count = 0
    @rating_sum = @bookings.each do |booking|
      if booking.brewery == @brewery
        sum += booking.rating
        count += 1
      end
    end
    @rating = sum.to_f / count.to_f
    @brewery.rating = @rating
    @brewery.save

    redirect_to profile_path
  end

  private

  def booking_params
    params.require(:booking).permit(:brewery_id, :start_date, :end_date)
  end

  def rating_params
    params.permit(:rating)
  end
end
