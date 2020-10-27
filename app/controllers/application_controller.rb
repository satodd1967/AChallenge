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

    def to_decimal(float)
        float/100
    end

    def define_attributes(object)
        object.attributes.select {
            |attr| attr != "id" &&
             attr != "user_id" &&
              attr != "updated_at" &&
               attr != "created_at" &&
                attr != "log_date"
            }
    end

    def reset_attributes(attribute)
        if attribute == "body_fat"
            attributes = "body_fat %"
        else
            attribute
        end
    end

end
