class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_recipes = @user.recipes
  end

  def edit
    @user = User.find(params[:id])
  end

  def mypage
    @user = current_user
    @user_recipes = @user.recipes
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
    params.require(:user).permit(:name, :introduction, :image)
  end
end
