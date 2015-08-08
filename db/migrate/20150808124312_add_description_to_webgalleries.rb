class AddDescriptionToWebgalleries < ActiveRecord::Migration
  def change
    add_column :webgalleries, :description, :string
  end
end
