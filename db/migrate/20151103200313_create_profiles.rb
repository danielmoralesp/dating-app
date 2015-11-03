class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :bio
      t.date :birthday
      t.integer :gender
      t.integer :looking_for
      t.string :interests

      t.timestamps null: false
    end
  end
end
