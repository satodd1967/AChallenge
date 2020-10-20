class SessionsController < ApplicationController
    

    def home
        @user = User.new
        if  logged_in?
            redirect_to user_path(current_user)
        else
            render :home
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def create
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "Incorrect Login"
            redirect_to root_path
        end
    end

end