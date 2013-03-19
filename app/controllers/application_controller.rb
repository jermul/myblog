class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  helper_method :admin?
  helper :all

  private

    def authorize
      unless admin?
        flash[:notice] = "unauthorized access"
        redirect_to home_path
        false
      end
    end

    def admin?
      signed_in? && current_user.admin?
    end
end
