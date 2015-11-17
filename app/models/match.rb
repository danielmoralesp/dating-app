class Match < ActiveRecord::Base
	belongs_to :user
	belongs_to :matchee, class_name: :User
end
