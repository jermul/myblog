class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  helper_method :admin?
  helper :all

  Disqus::defaults[:account] = 'jermdisorder'
  Disqus::defaults[:developer] = true # if you want to test it on the localhost
  Disqus::defaults[:hide_mods] = true
  Disqus::defaults[:show_powered_by] = false
  
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
