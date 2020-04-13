class WelcomeController < ApplicationController
    include ApplicationHelper
    layout "beforelogin"
    skip_before_action :require_login

    def homepage
        if logged_in?
            redirect_to user_path(current_user)
        else
            render :homepage
        end
    end
end
