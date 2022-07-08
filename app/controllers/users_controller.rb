class UsersController < ApplicationController

  def new #action for rendering the signup form
  end

  def create #for receiving the submitted form and creating a user with the form's parameters
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end

end