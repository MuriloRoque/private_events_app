class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    @invitation = current_user.invitations.build
    @user = User.find(params[:id])
    @past_user = current_user.events.past.order('date desc')
    @upcoming_user = current_user.events.upcoming.order('date asc')
    @past = Event.all.past.order('date desc')
    @upcoming = Event.all.upcoming.order('date asc')
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
