class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]

  def index
  end

  # def show
  # end

  def edit
  end

  def update
    binding.pry
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :type)
  end

  def load_user
    @user ||= current_user
  end
end
