class WelcomeController < ApplicationController
    include ApplicationHelper
    layout "beforelogin"

    def homepage
        if logged_in?
            redirect_to user_path(current_user)
        end
    end
end
