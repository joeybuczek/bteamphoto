class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :description
      t.string :genre
      t.references :collection, index: true

      t.timestamps
    end
  end
end
