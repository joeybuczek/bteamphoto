class AddBalanceCentsToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :balance_cents, :integer
  end
end
