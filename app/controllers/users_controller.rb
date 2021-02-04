class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  
  def show
  end
  
  def index
    @user = User.all
  end
  
  def new
    @user = User.new
    
    params = { user: {username: 'test1234', email: 'email@email'} }
  end
  
  def edit

  end
  
  
  def create
    @user = User.new(user_params)
    @user.password = params[:user][:password]
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Mads blog #{@user.username}, you have succesfully signed up"
      redirect_to articles_path
    else
      render 'new'
    end
  end
  
  def update
    if @user.update(user_params)
        #Giver besked efter man har trykket update
        flash[:notice] = "User was updated successfully!"
        redirect_to user_path(@user)
      else
        render 'edit'
      end
  end
  
  
  private
  def user_params
    params.require(:user).permit(:username, :email)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end