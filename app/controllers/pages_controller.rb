class PagesController < ApplicationController
  def profile
    @user = current_user
    @bookings = @user.bookings
    @breweries = Brewery.all
  end
end
