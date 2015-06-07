class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.references :invoice, index: true
      t.integer :price_cents

      t.timestamps
    end
  end
end
