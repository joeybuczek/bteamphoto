class InvoicesController < ApplicationController
  
  def create   
    @invoice = Invoice.new(params.require(:invoice).permit(:description, :balance, :invoiceable_id, :invoiceable_type)).save
    redirect_to request.referrer
  end
  
  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update_attributes(params.require(:invoice).permit(:description))
    redirect_to request.referrer
  end
  
  def show
    @invoice = Invoice.find(params[:id])
    # return user based on the parent class name of the invoice (constantized method)
    @user = @invoice.invoiceable_type.constantize.find(@invoice.invoiceable_id).user
  end

end
