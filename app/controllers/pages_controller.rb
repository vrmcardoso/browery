class PagesController < ApplicationController
  def profile
    @user = current_user
    @bookings = @user.bookings
  end
end
