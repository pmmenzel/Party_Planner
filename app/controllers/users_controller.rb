class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
  end
end
