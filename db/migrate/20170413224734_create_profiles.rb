class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.integer :age
      t.string :email
      t.string :phone

      t.timestamps null: false
      
      add_attachment :profiles, :avatar
      
      add_reference :profiles, :user, index: true
      add_foreign_key :profiles, :users
    end
  end
end
