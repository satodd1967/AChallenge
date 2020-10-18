class LogsController < ApplicationController

    before_action :find_log, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in 

    def new
        @log = Log.new
    end

    def create
        params[:log][:body_fat] = to_decimal(params[:log][:body_fat].to_f)
        @log = current_user.logs.build(log_params)
        if @log.save
            @log.create_log_scores
            redirect_to user_path(current_user)
       else
        render :new
       end
    end
    
    def show
        @log.body_fat = to_percent(@log.body_fat)
        redirect_to root_path if !@log  
    end

    def edit
    end

    def update
        params[:log][:body_fat] = to_decimal(params[:log][:body_fat].to_f)
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

    def find_log
        @log = Log.find_by_id(params[:id])
    end


end
