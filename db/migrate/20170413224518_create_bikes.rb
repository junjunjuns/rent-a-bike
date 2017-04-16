class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :name
      t.string :manufacturer
      t.string :color
      t.decimal :price
      t.string :description

      t.timestamps null: false
      
      add_attachment :bikes, :image
    end
  end
end
