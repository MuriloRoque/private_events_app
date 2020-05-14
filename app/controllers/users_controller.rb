class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
      if @user.save
         redirect_to root_path
      else
        render :new
    end
  end

  def new
    @user = User.new
  end 

  def show
    @user = User.all
  end
  
  private
   
   def user_params
    params.require(:user).permit(:name, :email)
  end

end