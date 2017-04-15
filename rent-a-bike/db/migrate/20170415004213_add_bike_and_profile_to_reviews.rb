class AddBikeAndProfileToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :bike, index: true
    add_foreign_key :reviews, :bikes
    add_reference :reviews, :profile, index: true
    add_foreign_key :reviews, :profiles
  end
end
