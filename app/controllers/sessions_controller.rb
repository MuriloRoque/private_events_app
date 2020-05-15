class SessionsController < ApplicationController

  def new
  end
  
  def create
    @user = User.find_by(name: params[:session][:name])
		if @user
			log_in @user
			redirect_to @user
		else
			redirect_to root_url
		end
  end
  
end