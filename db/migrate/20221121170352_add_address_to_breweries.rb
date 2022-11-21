class AddAddressToBreweries < ActiveRecord::Migration[7.0]
  def change
    add_column :breweries, :address, :string
  end
end
