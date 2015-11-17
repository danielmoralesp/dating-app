class RenameColumnsInMatchTable < ActiveRecord::Migration
  def change
  	rename_column :matches, :first_user, :user1_id
  	rename_column :matches, :second_user, :user2_id
  end
end
