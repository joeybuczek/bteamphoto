class Item < ActiveRecord::Base
  belongs_to :invoice
  monetize :price_cents
end
