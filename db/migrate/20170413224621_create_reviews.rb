class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :feedback
      t.decimal :rating

      t.timestamps null: false
      
      add_reference :reviews, :bike, index: true
      add_foreign_key :reviews, :bikes
      add_reference :reviews, :profile, index: true
      add_foreign_key :reviews, :profiles    end
  end
end
