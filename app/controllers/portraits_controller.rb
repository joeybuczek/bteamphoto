class PortraitsController < ApplicationController

	def new
		@user = User.find(params[:id])
		@portrait = Portrait.new
	end

  def create
  	@user = User.find(params[:portrait][:user_id])
  	@portrait = @user.portraits.build(portrait_params).save

  	redirect_to users_path
  end

  def show
  	@portrait = Portrait.find(params[:id])
  	@user = current_user
  	@invoice = @portrait.invoices.build
  	@invoices = @portrait.invoices
  end

  def update
  	@portrait = Portrait.find(params[:id])
  	@portrait.update_attributes(portrait_params)

  	redirect_to request.referrer
  end

  def destroy
  	@portrait = Portrait.find(params[:id])
  	@portrait.destroy

  	redirect_to request.referrer
  end

  private

  def portrait_params
  	params.require(:portrait).permit(:title, :description, :genre, :notes)
  end
end
