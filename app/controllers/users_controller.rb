class UsersController < ApplicationController
  
  def index
    @users = User.all
    @user = User.new
    @webgallery = Webgallery.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    # create user
    @user = User.new(params.require(:user).permit(:client_name, :email, :name_primary))
    @user.role = 'client'
    # randomly generated initial password to satisfy validation
    # new password generated when invitation is sent to user
    password = SecureRandom.hex(4)
    @user.password = password
    @user.password_confirmation = password
    if @user.save
      # User created successfully
    else
      flash[:error] = "There was an error creating the user."
    end
    
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
    @user = User.find(params[:id])
    unless @user.admin?
      @user.destroy
    else
      flash[:error] = "Cannot delete admin account."
    end
    redirect_to request.referrer
  end
  
  private
  
  def generate_token
    return "Generate Token Successful!"
  end
  
end
