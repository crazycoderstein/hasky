class SessionController < ApplicationController
    skip_before_action :require_login, only: %i[login create]
    before_action :already_in, except: %i[logout]
  
    def login; end

    def already_in
      if signed_in?
        redirect_to root_path
      end
    end
  
    def create
      user = User.find_by(username: params[:login])
        
      if user&.authenticate(params[:password])
        sign_in user
        redirect_to root_path
      else
        flash.now[:danger] = 'Please try again'
        redirect_to session_login_path
      end
    end
  
    def logout
      sign_out
      redirect_to session_login_path
    end
  end