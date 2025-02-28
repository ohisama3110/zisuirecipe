class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_user_path, notice: 'ユーザーを削除しました。'
  end
end
