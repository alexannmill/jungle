class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/"
    else
      redirect_to "/signup"
    end
  end

  def authenticate (email, password)
    @user = User.find_by_email_and_password(email, password)
    if @user && @user.authenticate_with_credentials(email, password)
  end


    private 

    def user_params
    params.require(:user).permit(
      :name, 
      :email, 
      :password,
    )
    end

end
