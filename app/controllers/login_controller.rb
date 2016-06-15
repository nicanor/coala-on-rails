class LoginController < ApplicationController

  include Concerns::SessionAware

  def submit
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_path,
        success: 'Ha iniciado sesión correctamente'
    else
      flash[:warning] = 'Credenciales inválidas'
      render 'log_in'
    end
  end

  def log_in
  end

  def log_out
    session[:user_id] = false
    redirect_to login_path,
      success: 'Ha cerrado sesión correctamente'
  end

end