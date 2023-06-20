class Api::UsersController < ApplicationController
  wrap_parameters include: User.attribute_names + ['password', 'email'] #what goes in this array???
  before_action :logged_in?

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      render :show
    else
      render json: {message: @user.errors.full_messages}, status: 422
    end
  end

  # def update

  # end

  # def destroy

  # end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password)
  end

end
