class ChargesController < ApplicationController
  def create
    # create customer with unique token
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )
    
    # create charge (Amount is its own class/model ... or ... pass this value in as argument/params?)
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 1000,
      description: "B-Team Photography payment from: #{current_user.email}",
      currency: 'usd'
    )
  
  flash[:notice] = "Payment successfully processed!"
  redirect_to client_landing_path
  
  # catch any errors and go back to payment process page
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "B-Team Photography payment from: #{current_user.email}",
      amount: 1000
    }
  end
end
