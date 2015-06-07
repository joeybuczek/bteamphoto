class ItemsController < ApplicationController
  def create
  	@invoice = Invoice.find(params[:item][:invoice_id])
  	@item = @invoice.items.build(params.require(:item).permit(:description, :price)).save
  	redirect_to request.referrer
  end

  def destroy
  	@item = Item.find(params[:id])
  	@item.destroy
  	redirect_to request.referrer
  end
end
