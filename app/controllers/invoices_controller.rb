class InvoicesController < ApplicationController
  
  def create   
    @invoice = Invoice.new(params.require(:invoice).permit(:description, :balance, :invoiceable_id, :invoiceable_type))
    @invoice.save
    redirect_to @invoice
  end
  
  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update_attributes(params.require(:invoice).permit(:description, :balance))
    redirect_to request.referrer
  end
  
  def show
    @invoice = Invoice.find(params[:id])
    # return user based on the parent class name of the invoice (constantized method)
    @user = @invoice.invoiceable_type.constantize.find(@invoice.invoiceable_id).user
    @parent_type = @invoice.invoiceable_type.constantize.find(@invoice.invoiceable_id)
    @item = Item.new
    @items = @invoice.items.all
    # take the math logic in the view and move it here into the controller
    @invoice_subtotal = 0
    @invoice_tax = 8
    @invoice_grand_total = 12
  end
  
  def destroy
    @invoice = Invoice.find(params[:id]).destroy
    redirect_to users_path
  end

end
