class TaxRatesController < ApplicationController
  def create
  	@tax_rate = TaxRate.new(params.require(:tax_rate).permit(:county, :rate)).save
    redirect_to request.referrer
  end

  def destroy
  	@tax_rate = TaxRate.find(params[:id])
    @tax_rate.destroy
    redirect_to request.referrer
  end

  def index
  	@tax_rate = TaxRate.new
  	@tax_rates = TaxRate.all
  end

  def update
    reset_default_rate
    @tax_rate = TaxRate.find(params[:id])
    @tax_rate.update_attributes(params_tax_rate)
    redirect_to request.referrer
  end

  private

  def params_tax_rate
    params.require(:tax_rate).permit(:county, :rate, :default_rate)
  end

  def reset_default_rate
    tax_rate_to_clear = TaxRate.find_by_default_rate(true).update_attributes(default_rate: false)
  end

end
