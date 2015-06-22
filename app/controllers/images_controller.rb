class ImagesController < ApplicationController
respond_to :html, :js

  def create
  	@collection = Collection.find(params[:image][:collection_id])
  	@image = @collection.images.build(params.require(:image).permit(:name, :description, :genre)).save
  	redirect_to request.referrer
  end

  def destroy
  	@image = Image.find(params[:id])
  	unless @image.destroy
      flash[:error] = "There was a problem deleting the image."
    end

  end
end
