class WelcomeController < ApplicationController
  def index
    @collection = Collection.find_by_genre('wedding')
    @images = @collection.images.all
  end

  def about
  end

  def contact
  end
  
  def client_landing
    @user = current_user
    @wedding = @user.wedding
  end
end
