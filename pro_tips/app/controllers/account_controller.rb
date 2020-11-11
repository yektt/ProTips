class AccountController < ApplicationController
  before_action :ensure_authenticated
  
  def edit
    @user = User.first
  end

  def update
    redirect_to account_path
  end

  def ensure_authenticated
    redirect_to sessions_new_path unless(logged_in?) 
  end
end
