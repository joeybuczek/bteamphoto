class AddCurrencyToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :balance_currency, :string
  end
end
