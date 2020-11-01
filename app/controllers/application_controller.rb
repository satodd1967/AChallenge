class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :to_percent, :to_float, :define_attributes, :reset_attributes

private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to root_path if !logged_in?
    end

    def to_percent(float)
        (float*100).round(2)
    end

    # def find_object(model)
    #     instance_variable_set(:"@#{model.class.name.downcase}", model.class.find_by(id: params[:id]))
    # end


end
