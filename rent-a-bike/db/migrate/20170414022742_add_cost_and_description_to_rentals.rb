class AddCostAndDescriptionToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :cost, :decimal
    add_column :rentals, :description, :string
  end
end
