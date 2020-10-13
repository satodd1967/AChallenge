class ChallengesController < ApplicationController
    before_action :find_challenge, only: [:show, :edit, :update]
    before_action :redirect_if_not_logged_in    

    def index
        @challenges = Challenge.all
    end

    def new
        @challenge = Challenge.new
    end
    
    def create
      @challenge = current_user.owned_challenges.build(challenge_params)
      if @challenge.save
          redirect_to new_challenge_challenge_goal_path(@challenge.id)
      else
          render :new
      end
    end
    
    def show
        @challenge = Challenge.find_by_id(params[:id])
        redirect_to root_path if !@challenge
    end

    def edit 
    end

    def update
        @challenge.update(challenge_params)
      if @challenge.save
        redirect_to challenge_path(@challenge)
      else
        render :edit
      end
    end

    private

    def challenge_params
        params.require(:challenge).permit(:name, :description, :start_date, :duration, :end_date, :active_calorie_goal, :points_worked_out, :points_tracked_food, :points_met_calorie_goal, :points_maintain_weight, :points_maintain_body_fat, :points_met_active_calorie_goal)
    end

    def find_challenge
        @challenge = Challenge.find_by(id: params[:id])
    end

end
