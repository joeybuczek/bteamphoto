class Invoice < ActiveRecord::Base
  belongs_to :invoiceable, polymorphic: true
  monetize :balance_cents
  has_many :items

  before_create :set_default_tax_rate_if_nil

  def set_default_tax_rate_if_nil
  	self.tax_rate ||= ".08"
  end

end
