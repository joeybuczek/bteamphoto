class WeddingsController < ApplicationController
  def create
    @user = User.find(params[:format])
    @wedding = Wedding.new(title: @user.client_name, bride: @user.name_primary, groom: @user.name_secondary)
    @wedding.user = @user
    @wedding.save
    redirect_to request.referrer
  end

  def show
    @user = User.find(params[:id])
    @wedding = @user.wedding
  end
  
  def update
    @wedding = Wedding.find(params[:id])
    @wedding.update_attributes(params.require(:wedding).permit(
      :bride,
      :groom,
      :date_wedding,
      :time_getting_ready,
      :time_ceremony,
      :time_formals,
      :time_receptions,
      :time_end,
      :location_getting_ready_bride,
      :location_getting_ready_groom,
      :location_ceremony,
      :location_reception,
      :notes,
      :balance
    ))
    redirect_to request.referrer
  end
  
end
