class Profile < ActiveRecord::Base
	belongs_to :user

	GENDER = ["male", "female", "other"]

	def match_gender
		GENDER[self.gender]
	end
end
