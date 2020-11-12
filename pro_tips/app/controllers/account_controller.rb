class AccountController < ApplicationController
  before_action :ensure_authenticated

  def edit
    @user = current_user
  end

  def update
  end
  
  private

  def current_user_params
    params.require(:user).permit(:email, :name, :avatar_url)
  end
end
