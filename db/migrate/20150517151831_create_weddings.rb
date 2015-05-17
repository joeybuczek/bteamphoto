class CreateWeddings < ActiveRecord::Migration
  def change
    create_table :weddings do |t|
      t.string :title
      t.references :user, index: true
      
      t.string :bride
      t.string :groom
      
      t.string :location_getting_ready_bride
      t.string :location_getting_ready_groom
      t.string :location_ceremony
      t.string :location_reception
      t.string :location_formals
      

      t.timestamps
    end
  end
end
