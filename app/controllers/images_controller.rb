class ImagesController < ApplicationController
  def create
  	@collection = Collection.find(params[:image][:collection_id])
  	@image = @collection.images.build(params.require(:image).permit(:name, :description, :genre)).save
  	redirect_to request.referrer
  end

  def destroy
  	@image = Image.find(params[:id])
  	@image.destroy
  	# redirect_to request.referrer

    respond_to do |format|
      format.html
      format.js
    end

  end
end
