class AddAttributesToBreweries < ActiveRecord::Migration[7.0]
  def change
    add_column :breweries, :delivery, :boolean
    add_column :breweries, :bottling, :boolean
    add_column :breweries, :bottle_labeling, :boolean
  end
end
