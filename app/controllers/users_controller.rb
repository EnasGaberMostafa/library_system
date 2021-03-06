class UsersController < ApplicationController
  skip_before_filter only: [:add_user]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_admin, only: [:index,:new,:create, :edit, :destroy]


  # GET /users
  # GET /users.json
  def index
    if params[:search]
      values = { search: "%#{ params[:search] }%" }

      conditions = %q{ users.userName       LIKE :search
                       OR users.email      LIKE :search}

      @users = User.where(conditions, values)
    else
      @users = User.all
    end
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
  end


  # POST /users
  # POST /users.json

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
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
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
   count = BorrowedBook.find_by_sql("SELECT * FROM borrowed_books where userId = '#{@user.id}'").count   
    puts count              
    if count==0
       @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
    else 
       redirect_to users_url, notice: 'User can not destroyed.' 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email,:userName, :password, :admin, :password_confirmation)
    end
    def authorize_admin
      if current_user.nil? 
        redirect_to root_path
      elsif !current_user.admin?
        redirect_to root_path
      end


      #return unless !current_user.nil? || !current_user.admin?
      #redirect_to root_path, alert: 'Admins only!'
    end
  
end
