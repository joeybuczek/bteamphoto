class AddGenreToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :genre, :string
  end
end
