class Admin::UsersController < Admin::AdminController
  before_action :only_authorize_admin, except: [:profile, :update_profile]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if @user == current_user
      redirect_to profile_path
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, success: 'Usuario creado con éxito.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user == current_user
      @user.update(profile_params)
      redirect_to profile_path, success: 'Información actualizada con éxito'
    elsif @user.update(user_params)
      redirect_to @user, success: 'Usuario actualizado con éxito.'
    else
      render :edit
    end
  end


  # GET /profile
  def profile
  end

  # POST /update_profile
  def update_profile
    if current_user.update(profile_params)
      redirect_to profile_path, success: 'Información actualizada con éxito'
    else
      render :edit
    end
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, success: 'Usuario eliminado con éxito.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :name)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
