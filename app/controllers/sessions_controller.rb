class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # ログイン成功の場合の処理
    else
      flash.now[:alert] = "メールアドレスまたはパスワードが正しくありません"
      render 'new'
    end
  end

end
