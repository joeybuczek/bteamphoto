class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :description
      t.decimal :balance
      t.datetime :due_date
      t.references :invoiceable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
