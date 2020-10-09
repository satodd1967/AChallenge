class LogsController < ApplicationController

    def show
        redirect_if_not_logged_in
        @log = Log.find_by_id(params[:id])
        redirect_to root_path if !@log  
    end

end
