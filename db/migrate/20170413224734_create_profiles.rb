class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.integer :age
      t.string :email
      t.string :phone
      t.string :profile_picture

      t.timestamps null: false
    end
  end
end
