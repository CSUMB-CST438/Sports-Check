class UsersController < ApplicationController

  before_action :set_user, except: [:index, :new, :create, :destroy]
  before_action :authenticate_user, except: [:index, :new, :create]

  def index
    if logged_in?
      @user = current_user 
    end
  end

  def show
  end

  def new
  end

  def edit
    redirect_to root_path unless @user == current_user
  end

  def create
    @user = User.find_by(school_name: params[:user][:school_name])
    if @user.nil?
      @user = User.create(user_params)
      school = School.create(name: params[:user][:school_name], user: @user)
      session[:user_id] = @user.id
      redirect_to students_path
    elsif @user.password == params[:user][:password]
      session[:user_id] = @user.id
      redirect_to students_path
    end
    # if @user.save
    #   session[:user_id] = @user.id
    #   render :index
    # else
    #   render :index 
    # end
  end

  def update
  end

  def destroy
    session[:user_id] = nil 
    redirect_to root_path
  end

  private

  def set_user 
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:school_name,:password)
  end

end
