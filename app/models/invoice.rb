class Invoice < ActiveRecord::Base
  belongs_to :invoiceable, polymorphic: true
  monetize :balance_cents
  has_many :items
end
