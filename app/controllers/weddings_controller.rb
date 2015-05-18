class WeddingsController < ApplicationController
  def create
    raise
  end

  def show
    @user = User.find(params[:id])
    @wedding = @user.wedding
  end
end
