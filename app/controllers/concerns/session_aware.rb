module Concerns::SessionAware
  extend ActiveSupport::Concern

  included do

    def current_user
      if session[:user_id]
        @current_user ||=
          User.find(session[:user_id])
      end
    end

    def logged_in?
      !! current_user
    end

    helper_method :current_user,
                  :logged_in?
  end

end