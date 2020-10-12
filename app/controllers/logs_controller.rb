class LogsController < ApplicationController

    def new
        @log = Log.new
    end

    def create
        @log = current_user.logs.build(log_params)
       if @log.save
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


end
