class SessionsController < ApplicationController
  
  def new
  
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in succesfully"
      redirect_to user
    else
      flash.now[:alert] = "There was something wrong with your login details. Please try again" #Fordi vi ikke redirect'er bruger man .now
      render 'new'
      
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:danger] = "Logged out"
    redirect_to root_path
  end

  
end
