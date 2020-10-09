class ChallengesController < ApplicationController

    def show
        redirect_if_not_logged_in
        @challenge = Challenge.find_by_id(params[:id])
        redirect_to root_path if !@challenge
    end

end
