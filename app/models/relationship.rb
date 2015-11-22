class Relationship < ActiveRecord::Base
	belongs_to :user
	belongs_to :ottr, class_name: :User

	RELATIONSHIP_STATUS = ["Matched","Unmatched"]

	def match_relationship_status
		RELATIONSHIP_STATUS[self.user_flag]
	end
end
