class Relationship < ActiveRecord::Base
	belongs_to :user
	belongs_to :ottr, class_name: :User
end
