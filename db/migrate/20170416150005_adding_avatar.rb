class AddingAvatar < ActiveRecord::Migration
  def change
    add_attachment :profiles, :avatar
    add_attachment :bikes, :image
  end
end
