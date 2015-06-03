class Wedding < ActiveRecord::Base
  belongs_to :user 
  has_many :invoices, as: :invoiceable
end
