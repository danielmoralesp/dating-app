class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :ottr_id
      t.integer :user_flag
      t.boolean :status

      t.timestamps null: false
    end
  end
end
