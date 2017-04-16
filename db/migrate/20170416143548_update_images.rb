class UpdateImages < ActiveRecord::Migration
  def change
    remove_column :bikes, :image, :string
    remove_column :profiles, :profile_picture, :string
  end
end
