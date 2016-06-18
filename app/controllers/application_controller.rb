class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :success,
                  :info,
                  :warning,
                  :danger

  def admin_path
    documents_path
  end

  def site
    @_site ||= Site.find_by(code: 'es')
  end
  helper_method :admin_path, :site

end