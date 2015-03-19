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
    user = current_user
    user.update_attributes(user_params)
    if user.save
      redirect_to user_url(user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :type)
  end
end
