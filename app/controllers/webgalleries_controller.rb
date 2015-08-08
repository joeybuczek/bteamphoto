class WebgalleriesController < ApplicationController
  def create
  	@user = User.find(params[:webgallery][:user])
  	@webgallery = @user.webgalleries.build(params.require(:webgallery).permit(:url, :genre, :description)).save
  	redirect_to request.referrer
  end

  def destroy
  	@webgallery = Webgallery.find(params[:id])
  	@webgallery.destroy
  	redirect_to request.referrer
  end
end
