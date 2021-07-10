class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def show
    @articles = @user.articles
    #@subscribers.new(:user_id, :current_user, set_author_id
    if params[:subscribe] == '1'
        flash[:notice] = "Your are now subscribed to this user"
        #redirect_to user_path(@user.id)
      #Kan forkortes:
      #redirect_to (@article)
    elsif params[:subscribe] == '0'
      # Fjern subscription
    end
  end
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
    
    params = { user: {username: 'test1234', email: 'email@email'} }
  end
  
  def edit

  end
  
  
  def create
    @user = User.new(user_params)
    @user.picture.attach(params[:users])
    @user.password = params[:user][:password]
    
    if @user.save!
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Mads blog #{@user.username}, you have succesfully signed up"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  
  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user #when user is detroyed we set session user to nil
    flash[:danger] = "Account and all associated articles are now deleted"
    redirect_to articles_path
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
    params.require(:user).permit(:username, :email, :picture)
  end
  
  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
      if current_user != @user && !current_user.admin?
      flash[:alert] = "You cannot edit others profile"
        redirect_to @user
      end
    end
  
  

end
