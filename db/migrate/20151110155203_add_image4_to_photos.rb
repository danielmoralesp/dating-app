class AddImage4ToPhotos < ActiveRecord::Migration
 def self.up
		change_table :photos do |t|
			t.attachment :image4
		end
	end

	def self.down
		drop_attached_file :photos, :image4
	end
end
