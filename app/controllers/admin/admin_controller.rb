class Admin::AdminController < ApplicationController

  before_action :authorize

  include Concerns::SessionAware

  def authorize
    if not current_user
      flash[:danger] =
       'Acceso no autorizado. ' +
       'Por favor inicie sesión.'
      redirect_to '/login'
    end
  end
end