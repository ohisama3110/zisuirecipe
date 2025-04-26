class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :show, :edit]
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @user_recipes = @user.recipes.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def mypage
    @user = current_user
    @user_recipes = @user.recipes.order(created_at: :desc)
    @groups = @user.groups
    @group = current_user.groups.first
    @notifications = current_user.invitations.where(read: false)
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to '/mypage'
    else
      render :edit
    end
  end

  def destroy
    current_user.destroy
    sign_out(current_user)
    redirect_to new_user_registration_path and return
  end

  private
    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end

    def authenticate_user
      redirect_to new_user_session_path unless user_signed_in?
    end

    def is_matching_login_user
      user = User.find(params[:id])
      unless user.id == current_user.id
        redirect_to '/mypage'
      end
    end

    def authenticate_user!
      if current_user.nil?
        redirect_to new_user_session_path, alert: "ログインが必要です"
      end
    end
end
