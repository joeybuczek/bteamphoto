class CreateTaxRates < ActiveRecord::Migration
  def change
    create_table :tax_rates do |t|
      t.string  :county
      t.decimal :rate
      t.boolean :default_rate

      t.timestamps
    end
  end
end
