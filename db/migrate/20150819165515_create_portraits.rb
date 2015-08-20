class CreatePortraits < ActiveRecord::Migration
  def change
    create_table :portraits do |t|
      t.string     :title
      t.string     :description
      t.text       :notes
      t.references :user, index: true
      t.string     :genre

      t.timestamps
    end
  end
end
