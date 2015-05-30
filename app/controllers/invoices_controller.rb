class InvoicesController < ApplicationController
  
  def create
    # Record type of parent instance
    parent_type = params[:invoice][:parent_type]
    parent_id = params[:invoice][:parent_id]
    
    # Create according to type
    if parent_type == "Wedding"
      @wedding = Wedding.find(parent_id)
      @invoice = @wedding.build_invoice(balance_params)
      @invoice.description = parent_type
      @invoice.save
      redirect_to request.referrer
    end
  end
  
  def update
    # Record type of parent instance
    parent_type = params[:invoice][:parent_type]
    parent_id = params[:invoice][:parent_id]
    
    # Create according to type
    if parent_type == "Wedding"
      @wedding = Wedding.find(parent_id)
      @invoice = @wedding.invoice
      @invoice.update_attributes(balance_params)
      @invoice.save
      redirect_to request.referrer
    end
  end
  
  private
  
  def balance_params
    params.require(:invoice).permit(:balance)
  end
    
end
