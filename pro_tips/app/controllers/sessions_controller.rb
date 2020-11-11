class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email].downcase)

    if(user.present? && user.authenticate(params[:password]))
      session[:user_id] = user.id
      redirect_to account_tips_path
    else
      flash[:alert] = "Email or password is invalid.  Please try again"
      render 'new'
    end
  end

  def destroy
  end
end
