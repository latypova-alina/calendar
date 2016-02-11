class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  

  # GET /meetings
  # GET /meetings.json
  def index
    @users = User.all
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
   
  end

  # GET /meetings/new
  def new
    @user = User.new
    
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @user = User.new(user_params)
    

    respond_to do |format|
      if @user.save
	
        format.html { redirect_to @user, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @user }
	sign_in @user
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Profile was successfully destroyed.' }
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
      params.require(:user).permit(:name, :email, :password, :meeting)
    end
    
end
