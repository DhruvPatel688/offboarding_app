# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def user_params
    permitted = [ :email ]
    if params[:user][:password].present?
      permitted += [ :password, :password_confirmation ]
    end
    params.require(:user).permit(permitted)
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
