class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:search].present?
      @users = User.where("name LIKE ?", "%#{params[:search]}%")
    else
      @users = User.all
    end
  end

  def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_user_path, notice: 'ユーザーを削除しました。'
  end
end
