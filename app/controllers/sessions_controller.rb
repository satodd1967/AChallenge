class SessionsController < ApplicationController
    
    skip_before_action :find_object

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
            flash[:message] = "Invalid Login"
            redirect_to root_path
        end
    end

    def fblogin
        if user = User.find_by(email: auth[:info][:email])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            @user = User.new(email: auth[:info][:email]) do |user|
                user.username = auth[:info][:name]
                user.password = "1aA!#{SecureRandom.hex(10)}"
            end
            if @user.save
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:message] = "Invalid Login"
                redirect_to root_path
            end
        end
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end