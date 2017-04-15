class UndoChangesToRentals < ActiveRecord::Migration
  def change
    remove_column :rentals, :bike_name, :string
    add_reference :rentals, :bike, index: true
    add_foreign_key :rentals, :bikes
  end
end