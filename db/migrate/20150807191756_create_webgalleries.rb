class CreateWebgalleries < ActiveRecord::Migration
  def change
    create_table :webgalleries do |t|
      t.string :url
      t.string :genre
      t.references :user, index: true

      t.timestamps
    end
  end
end
