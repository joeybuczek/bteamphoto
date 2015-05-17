class UsersController < ApplicationController
  
  def index
    @users = User.all
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params.require(:user).permit(:client_name, :email, :name_primary))
    @user.role = 'client'
    @user.password = 'changeme'
    @user.save
    redirect_to request.referrer
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
      :country,
      :phone_home,
      :phone_cell
      ))
    redirect_to request.referrer
  end
  
  def destroy
    @user = User.find(params[:format])
    unless @user == User.first
      @user.destroy
    end
    redirect_to request.referrer
  end
  
end
