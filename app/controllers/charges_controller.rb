class ChargesController < ApplicationController
  def create
    @invoice = Invoice.find(params[:id])

    # create customer with unique token
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )
    
    # create charge (Amount is its own class/model ... or ... pass this value in as argument/params?)
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @invoice.payment_cents,
      description: "B-Team Photography payment from: #{current_user.email}",
      currency: 'usd'
    )
  
  flash[:notice] = "Payment successfully processed!"
  @invoice.update_attributes(balance_cents: 0, payment_cents: 0)
  redirect_to @invoice
  
  # catch any errors and go back to payment process page
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end

  def new
    @invoice = Invoice.find(params[:id])
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      name: "B-Team Photography",
      description: @invoice.description,
      email: current_user.email,
      amount: @invoice.payment_cents
    }
  end

  def payment
    @invoice = Invoice.find(params[:id])

  end

end
