class ChallengeGoalsController < ApplicationController

    def new
        if params[:challenge_id] && @challenge = Challenge.find_by_id(params[:challenge_id])
            @challenge_goal = @challenge.challenge_goals.build(user_id: current_user.id)
        end
    end

end
