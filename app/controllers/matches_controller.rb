class MatchesController < ApplicationController
	def index
		@other_users = []
		@matched_users = []
		
		@other_profiles = Profile.where(gender: current_user.profile.looking_for)
		@other_profiles.each do |u|
			@other_users << u.user
		end

		@current_matches = Match.where(user_id: current_user.id)
		@current_matchees = Match.where(matchee_id: current_user.id)

		@current_matches.each do |m|
			@matched_users << m.matchee
		end

		# @current_matchees.each do |m|
		# 	@matched_users << m.user
		# end

		@other_users = @other_users - @matched_users

	end
end
