class Profile < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :birthday, :gender, :looking_for, :on => :create

	# accepts_nested_attributes_for :user

	GENDER = ["male", "female", "other"]

	def match_gender
		GENDER[self.gender]
	end
end
