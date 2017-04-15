class UpdateRentals < ActiveRecord::Migration
  def change
    remove_reference :rentals, :bike, index: true
    remove_foreign_key :rentals, :bikes
    add_column :rentals, :bike, :string
  end
end
