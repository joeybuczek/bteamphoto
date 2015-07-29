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
    @images = Image.where(genre: params[:genre])
    images_array = [];
    @images.each do |image|
      images_array << image.url
    end

    render json: images_array
  end

  def add_image
    
    # next step: work on passing in requirements
    @collection = Collection.where( genre: params[:genre] ).first
    @image = @collection.images.build( name: params[:name], genre: params[:genre] ).save

    render json: @image
  end

end
