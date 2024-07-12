class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def mon_compte
    @user = current_user
    @tools = current_user.tools
    @bookings = current_user.bookings
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_profile_path, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
