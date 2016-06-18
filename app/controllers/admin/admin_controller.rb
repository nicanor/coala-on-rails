class Admin::AdminController < ApplicationController

  before_action :authorize

  include Concerns::SessionAware

  def profile
  end

  def authorize
    if not current_user
      flash[:danger] =
       'Acceso no autorizado. ' +
       'Por favor inicie sesión.'
      redirect_to '/login'
    end
  end

  def only_authorize_admin
    if not current_user.is?(:admin)
      flash[:danger] = 'Acceso no autorizado.'
      redirect_to admin_path
    end
  end
end