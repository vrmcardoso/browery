class PagesController < ApplicationController
  def profile
    @user = current_user
    @bookings = @user.bookings
    @brewery = Brewery.all
  end
end
