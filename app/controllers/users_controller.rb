class UsersController < ApplicationController

    skip_before_action :redirect_if_not_logged_in, only: [:new, :create,]
    skip_before_action :permission_check
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
        redirect_to root_path if !@user
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
