class AddBikeAndProfileToRentals < ActiveRecord::Migration
  def change
    add_reference :rentals, :bike, index: true
    add_foreign_key :rentals, :bikes
    add_reference :rentals, :profile, index: true
    add_foreign_key :rentals, :profiles
  end
end
