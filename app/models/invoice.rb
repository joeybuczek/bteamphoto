class Invoice < ActiveRecord::Base
  belongs_to :invoiceable, polymorphic: true
  attr_reader :balance_cents, :balance_currency
  
  def initialize
    @balance_currency = "USD"
  end
  
end
