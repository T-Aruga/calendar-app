class SessionsController < ApplicationController

  def sign_in
    user = User.find_by(email: params[:user][:email])
    if user&.authenticate(params[:user][:password])
      log_in(user)
      render json: user.as_json(only: [:name, :email] )
    else
      render json: { error: 'メールアドレスもしくはパスワードが正しくありません' }, status: :unauthorized
    end
  end

  def sign_out
    log_out if logged_in?
  end
end
