class ImagesController < ApplicationController
respond_to :html, :js, :json

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

  def gallery_images
    @images = Image.all
    images_array = [];
    @images.each do |image|
      images_array << image.url
    end

    render json: images_array
  end

end
