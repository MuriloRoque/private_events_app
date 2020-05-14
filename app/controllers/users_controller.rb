class UsersController < ApplicationController
  def index
    @posts = User.all
  end
end