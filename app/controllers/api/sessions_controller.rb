class Api::SessionsController < ApplicationController
  before_action :logged_in?

  def show
    @user = current_user
    if @user
      render 'api/users/show'
    else
      render json: {user: nil}
    end
  end

  def create
    email = params[:email]
    password = params[:password]
    @user = User.find_by_credentials(email, password)
    if @user
      login!(@user) #backend login! dealing with my tables
      render 'api/users/show' #frontend render
    else
      render json: {errors: ['Invalid Credentials']}, status: 403
    end
  end

  def destroy
    logout!
    render json: {message: ['you have successfully logged out']}
  end
end
