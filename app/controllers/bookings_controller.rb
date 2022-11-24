class BookingsController < ApplicationController
  def create
    @brewery = Brewery.find(params[:brewery_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.brewery = @brewery
    authorize @booking

    if @booking.save
      redirect_to brewery_path(@brewery), notice: "Booking was sucessfully created"
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def booking_params
    params.require(:booking).permit(:brewery_id, :start_date, :end_date)
  end
end
