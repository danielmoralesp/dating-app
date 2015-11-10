class Photo < ActiveRecord::Base
	attached_file :image1, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image1, :content_type => /\Aimage\/.*\Z/

	attached_file :image2, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image1, :content_type => /\Aimage\/.*\Z/

	attached_file :image3, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image1, :content_type => /\Aimage\/.*\Z/

	belongs_to :user
end
