class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :first_user
      t.integer :second_user

      t.timestamps null: false
    end
  end
end
