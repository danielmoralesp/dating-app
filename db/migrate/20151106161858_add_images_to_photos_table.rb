class AddImagesToPhotosTable < ActiveRecord::Migration
	def self.up
		change_table :photos do |t|
			t.attachment :image1
			t.attachment :image2
			t.attachment :image3
		end
	end

	def self.down
		drop_attached_file :photos, :image1
		drop_attached_file :photos, :image2
		drop_attached_file :photos, :image3
	end
end
