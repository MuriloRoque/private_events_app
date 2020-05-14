class SessionsController < ApplicationController

  def new
    @user = User.find_by(params[:email])
    if @user && @user.email == params[:email]
        session[:user_id] = @user.id
        flash[:success] = "You have successfully logged in."
        redirect_to root_path
  end
end
end