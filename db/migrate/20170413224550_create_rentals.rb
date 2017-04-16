class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
      
      add_reference :rentals, :bike, index: true
      add_foreign_key :rentals, :bikes
      add_reference :rentals, :profile, index: true
      add_foreign_key :rentals, :profiles
    end
  end
end
