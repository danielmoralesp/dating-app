class MatchesController < ApplicationController
	def index
		r = Relationship.arel_table
		@relationships_active = Relationship.where(r[:user_id].eq(current_user.id).or(r[:ottr_id].eq(current_user.id)).and(r[:status].eq(true))).first

		if @relationships_active
			redirect_to relationships_path(@relationships_active.id)
		else

			@other_users = []
			@matched_users = []

			@other_profiles = Profile.where(gender: current_user.profile.looking_for)
			@other_profiles.each do |u|
				@other_users << u.user
			end

			@current_matches = Match.where(user_id: current_user.id)
		# @current_matchees = Match.where(matchee_id: current_user.id)

		@current_matches.each do |m|
			@matched_users << m.matchee
			@matched_users << m.nonmatchee
		end

		# @current_matchees.each do |m|
		# 	@matched_users << m.user
		# end

		@other_users = @other_users - @matched_users
	end
end

def set_like
	@all_matches = Match.all
	@new_match = Match.new

	@new_match.user_id = current_user.id
	@new_match.matchee_id = params[:id]

	@all_matches.each do |m|
		puts 'user ' + m.user_id.to_s
		puts 'matchee ' + m.matchee_id.to_s
		if m.user_id == @new_match.matchee_id && m.matchee_id == @new_match.user_id
			Relationship.create(user_id: m.user_id, ottr_id: m.matchee_id, user_flag: 0, status: true)
		else
			@new_match.save
		end
	end

end

def set_dislike
	@new_match = Match.new
	@new_match.user_id = current_user.id
	@new_match.nonmatchee_id = params[:id]

	@new_match.save
end
end
