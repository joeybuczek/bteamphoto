class Wedding < ActiveRecord::Base
  belongs_to :user 
  has_one :invoice, as: :invoiceable
end
