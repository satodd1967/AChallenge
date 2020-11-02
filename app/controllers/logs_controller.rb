class LogsController < ApplicationController

    before_action :log_checks, only: [:show, :edit, :update, :destroy]
    before_action :convert_decimal, only: [:show, :edit]
    before_action :redirect_if_not_logged_in

    def new
        @log = Log.new
    end

    def create
        @log = current_user.logs.build(log_params)
        if @log.save
            @log.create_log_scores
            redirect_to user_path(current_user)
       else
        render :new
       end
    end
    
    def show  
    end

    def edit
    end

    def update
        @log.update(log_params)
        if @log.save
            @log.update_log_scores
            redirect_to user_path(current_user)
        else
            render :edit
        end
    end

    def destroy
        @log.destroy
        redirect_to user_path(current_user)
    end

    private

    def log_params
        params.require(:log).permit(:log_date, :worked_out, :tracked_food, :weight, :body_fat, :active_calories, :calories)
    end

    def log_checks
        if !@log
            redirect_to user_path(current_user)
            flash[:message] = "Invalid Log"
        end
        if @log.user != current_user
            redirect_to user_path(current_user)
            flash[:message] = "Not Allowed"
        end
    end

    def convert_decimal
        @log.body_fat = to_percent(@log.body_fat)
    end

end
