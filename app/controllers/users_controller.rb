class UsersController < ApplicationController

  def index 
    @user = User.all 
  end 

  def show 
    @user = User.find_by(id: params[:id])
    if @user.nil? 
      head :not_found
      return 
    end 
  end 

  def login_form 
    @user = User.new
  end 

  def login 
    user = User.find_by(username: params[:user][:username])
    if user.nil? 
      user = User.new(username: params[:user][:username])
      if !user.save 
        flash[:error] = "Unable to login"
        redirect_to root_path
      end 

      flash[:welcome] = "Welcome #{user.username}"
    else
      flash[:welcome] = "Welcome back #{user.username}"
    end 

    session[:user_id] = user.id
    redirect_to root_path
  end 

  

  def logout 

  end 

  def current 

  end 


end
