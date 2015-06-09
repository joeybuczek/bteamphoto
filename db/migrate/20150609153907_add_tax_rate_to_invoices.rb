class AddTaxRateToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :tax_rate, :decimal
  end
end
