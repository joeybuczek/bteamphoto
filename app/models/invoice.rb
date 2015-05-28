class Invoice < ActiveRecord::Base
  belongs_to :invoiceable, polymorphic: true
end
