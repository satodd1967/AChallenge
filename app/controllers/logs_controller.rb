class LogsController < ApplicationController

    def new
        @log = Log.new
    end

    def create
        binding.pry
    end
    
    def show
        redirect_if_not_logged_in
        @log = Log.find_by_id(params[:id])
        redirect_to root_path if !@log  
    end



end
