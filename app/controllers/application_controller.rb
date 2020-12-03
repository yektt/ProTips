class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user, :is_admin?

  before_action :set_locale

  def current_user
    if(@current_user.present?)
      return @current_user
    end
    @current_user = User.find(session[:user_id])
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def ensure_authenticated
    redirect_to login_path unless(logged_in?)
  end

  def is_admin?
    return false unless(logged_in?)
    true if(current_user.role == 'admin')
  end

  def logged_in? 
    session[:user_id].present?
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
