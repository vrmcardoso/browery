class RemoveBreweryAttributesFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :brewery_name, :string
    remove_column :users, :brewery_address, :string
  end
end
