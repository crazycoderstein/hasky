class ApplicationController < ActionController::Base
    include SessionHelper
  
    before_action :require_login

    around_action :switch_locale
    private
  
    def require_login
      unless signed_in?
        flash[:danger] = 'Log in firstly!'
        redirect_to session_login_url
      end
    end

    def switch_locale(&action)
      locale = locale_from_url || I18n.default_locale
      I18n.with_locale locale, &action
    end

    def locale_from_url
      locale = params[:locale]
      return locale if I18n.available_locales.map(&:to_s).include?(locale)
      
    end

    def default_url_options
      { locale: I18n.locale }
    end

    #def current_user
     # @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
    #send
  
    # def signed_in?
    #   current_user.present?
    # end
  
    # def no_signed_in?
    #   !current_user.present?
    # end
  
    # def sign_out
    #   session.delete :user_id
    # end
  
    # def no_authentication
    #   return if no_signed_in?
  
    #   flash[:warning] = 'You are already signed in.'
    #   redirect_to root_path
    # end
  
    # def authentication
    #   return if signed_in?
  
    #   flash[:warning] = 'You are not logged in yet.'
    #   redirect_to root_path
    # end
  
    # helper_method :current_user, :signed_in?
    # helper_method :current_user, :no_signed_in?
  end