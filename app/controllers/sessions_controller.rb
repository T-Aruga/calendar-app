class SessionsController < ApplicationController

  def sign_in
    user = User.find_by(email: params[:user][:email])
    if user&.authenticate(params[:user][:password])
      session[:user_id] = user.id
      render json: { message: 'ログインに成功しました!', name: user.name }
    else
      render json: { error: 'メールアドレスもしくはパスワードが正しくありません' }, status: :unauthorized
    end
  end
end
