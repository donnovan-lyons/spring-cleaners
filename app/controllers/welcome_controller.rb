class WelcomeController < ApplicationController
    include ApplicationHelper
    layout "beforelogin"
    skip_before_action :require_login

    def homepage
        if current_user
            redirect_to user_path(current_user)
        else
            render :homepage
        end
    end
end
