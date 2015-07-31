class AddPaymentToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :payment_cents, :integer
  end
end
