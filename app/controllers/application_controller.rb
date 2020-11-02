class ApplicationController < ActionController::Base

    before_action :find_object, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in
    before_action :permission_check, only: [:show, :edit, :update, :destroy]

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

    def find_object
        instance_variable_set(:"@#{self.controller_path.singularize}",
         (self.controller_path.singularize.classify.constantize).find_by(id: params[:id]))
    end

    def permission_check
        if instance_variable_get(:"@#{self.controller_path.singularize}").user != current_user
            redirect_to user_path(current_user)
            flash[:message] = "Not Allowed"
        end
    end

    # def variable_check
    #     if !instance_variable_get(:"@#{self.controller_path.singularize}")
    #         redirect_to user_path(current_user)
    #         flash[:message] = "Invalid object"
    #     end
    # end
    
end
