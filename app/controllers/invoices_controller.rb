require 'bigdecimal'
class InvoicesController < ApplicationController
  
  def create   
    @invoice = Invoice.new(params.require(:invoice).permit(:description, :balance, :invoiceable_id, :invoiceable_type, :tax_rate))
    # add default tax_rate if none provided
    if @invoice.tax_rate.nil? then @invoice.tax_rate = default_tax_rate end
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
    @items.each do |item|
      @invoice_subtotal = @invoice_subtotal + item.price
    end

    # calculate tax on subtotal
    @invoice_tax = Money.new((@invoice.tax_rate * @invoice_subtotal.to_d) * 100)

    # sum up grand total
    @invoice_grand_total = @invoice_subtotal + @invoice_tax
  end
  
  def destroy
    @invoice = Invoice.find(params[:id]).destroy
    redirect_to users_path
  end

  private

  def default_tax_rate
    return ".08"
  end

end
