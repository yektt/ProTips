class AccountController < ApplicationController
  before_action :ensure_authenticated

  def edit
    @user = current_user
  end

  def update
    redirect_to account_path
  end

end
