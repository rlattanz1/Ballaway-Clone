class Api::UsersController < ApplicationController
  wrap_parameters include: User.attribute_names + ['password', 'email']

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      render :show
    else
      render json: {message: @user.errors.full_messages}, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password)
  end

end
