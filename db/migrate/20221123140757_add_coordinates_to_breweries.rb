class AddCoordinatesToBreweries < ActiveRecord::Migration[7.0]
  def change
    add_column :breweries, :latitude, :float
    add_column :breweries, :longitude, :float
  end
end
