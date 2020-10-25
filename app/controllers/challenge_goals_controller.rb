class ChallengeGoalsController < ApplicationController
    before_action :find_challenge_goal, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in 

    def new
        if params[:challenge_id] && @challenge = Challenge.find_by_id(params[:challenge_id])
            @challenge_goal = @challenge.challenge_goals.build(user_id: current_user.id)
        else
            redirect_to user_path(current_user)
        end
    end

    def create
        params[:challenge_goal][:challenge_id] = params[:challenge_id]
        params[:challenge_goal][:start_body_fat] = to_decimal(params[:challenge_goal][:start_body_fat].to_f)
        @challenge_goal = current_user.challenge_goals.build(challenge_goal_params)
        if @challenge_goal.save
            @challenge_goal.cg_create_log_scores
            redirect_to user_path(current_user)
        else
            render :new
        end
    end

    def show
    end

    def edit
        @challenge_goal.start_body_fat = to_percent(@challenge_goal.start_body_fat)
    end

    def update
        params[:challenge_goal][:start_body_fat] = to_decimal(params[:challenge_goal][:start_body_fat].to_f)
        @challenge_goal.update(challenge_goal_params)
        if @challenge_goal.save
            @challenge_goal.user.logs.each do |log|
                log.update_log_scores
            end
            redirect_to user_path(current_user)
        else
            render :edit
        end
    end

    def destroy
        @challenge_goal.destroy
        redirect_to user_path(current_user)
    end

    private

    def challenge_goal_params
        params.require(:challenge_goal).permit(:start_weight, :start_body_fat, :start_calorie_goal, :challenge_id)
    end

    def find_challenge_goal
        @challenge_goal = ChallengeGoal.find_by(id: params[:id])
    end


end
