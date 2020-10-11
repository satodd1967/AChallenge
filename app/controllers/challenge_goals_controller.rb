class ChallengeGoalsController < ApplicationController

    def new
        if params[:challenge_id] && @challenge = Challenge.find_by_id(params[:challenge_id])
            @challenge_goal = Challenges.challengegoals.build(@challenge)
        end
    end

end
