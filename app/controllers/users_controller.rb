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
      render "profile", status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    @user.update(user_params)

    redirect_to profile_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :address, :photo)
  end
end
