class UsersController < ApplicationController
  def show
    puts params
  end

  def index
    @users = User.all
  end
end
