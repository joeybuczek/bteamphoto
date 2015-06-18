class CollectionsController < ApplicationController
  def index
  	@collections = Collection.all
  	@collection = Collection.new
  end

  def create
  	@collection = Collection.new(collection_params).save
  	redirect_to collections_path
  end

  def edit
  	@collection = Collection.find(params[:id])
  end

  def update
  	@collection = Collection.find(params[:id])
  	@collection.update_attributes(collection_params)
  	redirect_to collections_path
  end

  def destroy
  	@collection = Collection.find(params[:id])
  	@collection.destroy
  	redirect_to collections_path
  end

  private

  def collection_params
  	params.require(:collection).permit(:name, :description, :genre)
  end

end
