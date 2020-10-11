class ChallengeGoalsController < ApplicationController

    def new
        if params[:challenge_id] && @challenge = Challenge.find_by_id(params[:challenge_id])
            @challenge_goal = @challenge.challenge_goals.build(user_id: current_user.id)
        else
            redirect_to root_path 
        end
    end

    def create
        binding.pry
    end

    private

    def challenge_goal_params
        params.require(:challenge_goal).permit(:start_weight, :start_body_fat, :start_calorie_goal)
    end


end
