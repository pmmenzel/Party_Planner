class Users::SessionsController < Devise::SessionsController

  # def sign_in_params
  #   devise_parameter_sanitizer.sanitize(:sign_in) do |u|
  #     u.permit(:email, :password)
  #   end
  # end

  def new
    super
  end

  def create
    binding.pry
    super
  end

  def destroy
    super
  end

end