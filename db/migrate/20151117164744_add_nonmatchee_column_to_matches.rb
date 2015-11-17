class AddNonmatcheeColumnToMatches < ActiveRecord::Migration
  def change
  	add_column :matches, :nonmatchee_id, :integer
  end
end
