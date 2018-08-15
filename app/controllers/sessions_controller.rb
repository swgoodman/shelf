class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
    user = User.find_by_id(params[:id])
    if !user
      redirect_to root_path
    else
      session[:user_id] = user.idea
      redirect_to user_path(user)
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
