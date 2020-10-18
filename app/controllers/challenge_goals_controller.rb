class ChallengeGoalsController < ApplicationController
    before_action :find_challenge_goal, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in 

    def new
        if params[:challenge_id] && @challenge = Challenge.find_by_id(params[:challenge_id])
            @challenge_goal = @challenge.challenge_goals.build(user_id: current_user.id)
        else
            # you need to change where this redirects to.  This needs to redirect to the new path for challenge_goals, but it also needs to retain the challenge_id from the previous transaction.  If not there will be a challenge created by a user without a challenge_goal for that user created.
            # Eventually you will need to have error handling that always checkes for users with owned challenges that don't have challenge goals and forces them to create them bofore they get to the home page.  This is in case they somehow get logged out or something while creating a new
            # challenge, but before creating a challenge goal for it.  You only create challenge goals 2 ways.  You create a challenge or you join a challenge.  You could consider not forcing an owner to participate.
            redirect_to root_path 
        end
    end

    def create
        binding.pry
        params[:challenge_goal][:challenge_id] = params[:challenge_id]
        params[:challenge_goal][:start_body_fat] = to_decimal(params[:challenge_goal][:start_body_fat].to_f)
        @challenge_goal = current_user.challenge_goals.build(challenge_goal_params)
        if @challenge_goal.save
            redirect_to user_path(current_user)
        else
            render :new
        end
    end

    def show
    end

    def edit
        @challenge_goal.start_body_fat = to_percent(@challenge_goal.start_body_fat)
        binding.pry
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

    private

    def challenge_goal_params
        params.require(:challenge_goal).permit(:start_weight, :start_body_fat, :start_calorie_goal, :challenge_id)
    end

    def find_challenge_goal
        @challenge_goal = ChallengeGoal.find_by(id: params[:id])
    end


end
