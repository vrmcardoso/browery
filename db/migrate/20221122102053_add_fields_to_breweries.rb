class AddFieldsToBreweries < ActiveRecord::Migration[7.0]
  def change
    add_column :breweries, :size, :integer
    add_column :breweries, :capacity, :integer
  end
end
