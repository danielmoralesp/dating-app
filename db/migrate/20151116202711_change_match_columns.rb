class ChangeMatchColumns < ActiveRecord::Migration
  def change
  	rename_column :matches, :user1_id, :user_id
  	rename_column :matches, :user2_id, :matchee_id
  end
end
