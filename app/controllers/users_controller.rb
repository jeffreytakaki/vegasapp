class UsersController < ApplicationController
  
  before_action :set_user, :only => [:show, :edit, :update, :destroy]

  respond_to :json, :html

  def index
    @users = User.all
    respond_with @users 
  end

  def show
    respond_with @users
  end

  def new
      @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      respond_to do |format|
        format.html { redirect_to users_path }
        format.json { render json: @user, status: :created }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # def edit
  # end

  # def update

  #   if @user.update(user_params)
  #     respond_to do |format|
  #       format.html { redirect_to users_path }
  #       format.json { render nothing: true, status: :no_content }
  #     end
  #   else
  #     respond_to do |format|
  #       format.html { render 'edit' }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  # end

  protected

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :guest, :mgm, :sat, :sun, :mon)
  end
end
