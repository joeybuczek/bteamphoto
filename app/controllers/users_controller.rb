class UsersController < ApplicationController
  
  def index
    @users = User.all
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params.require(:user).permit(
      :user_name,
      :client_name,
      :name_primary,
      :name_secondary,
      :email,
      :street_address, 
      :city,
      :state,
      :zip_code,
      :phone_home,
      :phone_cell
      ))
    redirect_to request.referrer
  end
  
end
