class CreateBreweries < ActiveRecord::Migration[7.0]
  def change
    create_table :breweries do |t|
      t.string :description
      t.string :name
      t.float :price
      t.float :rating
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
