class LogsController < ApplicationController

    before_action :find_log, only: [:show, :edit, :update]
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
        redirect_if_not_logged_in
        @log = Log.find_by_id(params[:id])
        redirect_to root_path if !@log  
    end

    private

    def log_params
        params[:log][:body_fat] = to_float(params[:log][:body_fat].to_f)
        params.require(:log).permit(:log_date, :worked_out, :tracked_food, :weight, :body_fat, :active_calories, :calories)
    end

    def find_log
        @log = Log.find_by(id: params[:id])
    end


end
