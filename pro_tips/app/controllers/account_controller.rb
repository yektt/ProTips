class AccountController < ApplicationController
  before_action :ensure_authenticated

  def edit
    @user = current_user
  end

  def update
    logger.info(user.name)
    respond_to do |format|
      if @user.update(current_user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  private

  def current_user_params
    params.require(:user).permit(:email, :name, :avatar_url)
  end
end
