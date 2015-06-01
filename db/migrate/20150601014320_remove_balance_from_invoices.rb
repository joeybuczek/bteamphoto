class RemoveBalanceFromInvoices < ActiveRecord::Migration
  def change
    remove_column :invoices, :balance
  end
end
