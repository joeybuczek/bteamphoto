require 'bigdecimal'
class InvoicesController < ApplicationController
  
  def create   
    @invoice = Invoice.new(params.require(:invoice).permit(:description, :balance, :invoiceable_id, :invoiceable_type, :tax_rate))
    # default tax rate is set before create if none given (see model)
    @invoice.save
    redirect_to @invoice
  end
  
  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update_attributes(params.require(:invoice).permit(:description, :balance, :tax_rate))
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

    # sum up item prices for invoice subtotal
    @invoice_subtotal = 0
    @items.each { |item| @invoice_subtotal+=item.price }

    # Old method as explanation (06-11-15)
    # @items.each do |item|
    #   @invoice_subtotal = @invoice_subtotal + item.price
    # end

    # calculate tax on subtotal
    @invoice_tax = Money.new((@invoice.tax_rate * @invoice_subtotal.to_d) * 100)

    # sum up grand total
    @invoice_grand_total = @invoice_subtotal + @invoice_tax
  end
  
  def destroy
    @invoice = Invoice.find(params[:id]).destroy
    redirect_to users_path
  end

end
