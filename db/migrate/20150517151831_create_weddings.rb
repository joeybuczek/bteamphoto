class CreateWeddings < ActiveRecord::Migration
  def change
    create_table   :weddings do |t|
      t.string     :title
      t.references :user, index: true
      
      t.string     :bride
      t.string     :groom
      
      t.string     :location_getting_ready_bride
      t.string     :location_getting_ready_groom
      t.string     :location_ceremony
      t.string     :location_reception
      t.string     :location_formals
      
      t.date       :date_wedding
      t.time       :time_getting_ready
      t.time       :time_ceremony
      t.time       :time_receptions
      t.time       :time_formals
      t.time       :time_end
      
      t.decimal    :balance, :precision => 8, :scale => 2
      t.text       :notes

      t.timestamps
    end
  end
end
