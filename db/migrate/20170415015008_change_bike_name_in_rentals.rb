class ChangeBikeNameInRentals < ActiveRecord::Migration
  def change
    rename_column :rentals, :bike, :bike_name
  end
end
