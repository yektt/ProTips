class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  def default_url_options
    { locale: I18n.locale }
  end

end
