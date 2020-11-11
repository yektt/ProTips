class AccountController < ApplicationController
  before_action :ensure_authenticated

  helper_method :current_user
  
  def edit
    @user = current_user
  end

  def update
    redirect_to account_path
  end

  def ensure_authenticated
    redirect_to sessions_new_path unless(logged_in?) 
  end

  def current_user
    User.find(session[:user_id])
  end
end
