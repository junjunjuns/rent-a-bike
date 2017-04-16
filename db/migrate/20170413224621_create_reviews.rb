class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :feedback
      t.decimal :rating

      t.timestamps null: false
    end
  end
end
