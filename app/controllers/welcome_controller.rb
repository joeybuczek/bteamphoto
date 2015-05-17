class WelcomeController < ApplicationController
  def index
  end

  def about
  end

  def contact
  end
  
  def client_landing
    @user = current_user
  end
end
