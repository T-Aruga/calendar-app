class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { message: "Sign up Success!!!" }
    else
      render json: { message: "#{@user.errors.full_messages}" }, status: 400
    end
  end



  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
