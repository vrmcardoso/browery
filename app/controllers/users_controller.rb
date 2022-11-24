class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      authorize @user
    else
      render "breweries", status: :unprocessable_entity
    end
  end

end
