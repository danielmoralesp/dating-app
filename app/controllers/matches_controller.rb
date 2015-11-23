class MatchesController < ApplicationController
	def index

		# Creates arel table with all relationship records, then stores any relationship where user_id or ottr_id is equal to the current_user id AND where relationship is active
		r = Relationship.arel_table
		@relationships_active = Relationship.where(r[:user_id].eq(current_user.id).or(r[:ottr_id].eq(current_user.id)).and(r[:status].eq(true))).first

		# if user has an active relationship, they will be redirected to show their current relationship and will no longer see any other matches
		if @relationships_active
			redirect_to relationships_path(@relationships_active)
		else

			@other_users = []
			@matched_users = []

			# gets all profiles where gender is equal to what the current user is seeking and adds the user object to @other_users array
			@other_profiles = Profile.where(gender: current_user.profile.looking_for)
			@other_profiles.each do |u|
				@other_users << u.user
			end

			# Finds all existing Matches that current user has initiated and adds matchee/nonmatchee users to array
			@current_matches = Match.where(user_id: current_user.id)
			
			@current_matches.each do |m|
				@matched_users << m.matchee
				@matched_users << m.nonmatchee
			end

			# List of users who have already been liked/disliked by current user are removed from list of all available users that current user is looking for
			@other_users = @other_users - @matched_users

			# @current_matchees = Match.where(matchee_id: current_user.id)
			# @current_matchees.each do |m|
			# 	@matched_users << m.user
			# end

			
		end
	end

	def set_like
		@all_matches = Match.all
		@new_match = Match.new

		@new_match.user_id = current_user.id
		@new_match.matchee_id = params[:id]

		@all_matches.each do |m|
			if m.user_id == @new_match.matchee_id && m.matchee_id == @new_match.user_id
				@new_match = Relationship.new(user_id: m.user_id, ottr_id: m.matchee_id, user_flag: 0, status: true)
			end
		end

		if @new_match.save
			respond_to do |format|
				format.js
			end
		end

	end

	def set_dislike
		@new_match = Match.new
		@new_match.user_id = current_user.id
		@new_match.nonmatchee_id = params[:id]

		if @new_match.save
			respond_to do |format|
				format.js
			end
		end
	end
end
