class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user1_id
      t.integer :user2_id
      t.boolean :user1_key
      t.boolean :user2_key
      t.boolean :active

      t.timestamps null: false
    end
  end
end
