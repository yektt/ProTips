class UsersController < ApplicationController
  include RolesHelper

  before_action :set_user,                  only: [:show, :edit, :update, :destroy]
  before_action :authorize_to_edit_user,    only: [:edit, :update]
  before_action :ensure_admin,              only: [:index, :destroy]

  def index
    @users = User.all.page(params[:page])
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        session[:user_id] = @user.id
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(edit_user_params)
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy!
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.js
    end
  end

  private
    def authorize_to_edit_user
      redirect_to(account_path) unless(can_update?(@user))
    end

    def edit_user_params
      params.require(:user).permit(:email, :name, :role, :avatar)
    end
    
    def ensure_admin
      if (logged_in?)
        redirect_to account_path unless (current_user.role == 'admin')
      else
        redirect_to login_path
      end
    end

    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
