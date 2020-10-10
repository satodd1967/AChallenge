class ChallengesController < ApplicationController

    def index
        @challenges = Challenge.all
    end

    def new
        @challenge = Challenge.new
      end
    
    def create
      @challenge = current_user.owned_challenges.build(challenge_params)
      if @challenge.save
          redirect_to challenges_path
      else
          render :new
      end
    end
    
    def show
        redirect_if_not_logged_in
        @challenge = Challenge.find_by_id(params[:id])
        redirect_to root_path if !@challenge
    end

    private

    def challenge_params
        params.require(:challenge).permit(:name, :description, :start_date, :duration, :end_date, :active_calorie_goal, :points_worked_out, :points_tracked_food, :points_met_calorie_goal, :points_maintain_weight, :points_maintain_body_fat, :points_met_active_calorie_goal)
    end

end
