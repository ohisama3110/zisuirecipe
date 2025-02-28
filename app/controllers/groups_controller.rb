class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @recipe = Recipe.new
    @groups = Group.all
  end

  def show
    @recipe = Recipe.new
    @group = Group.find(params[:id])
    @group_users = @group.users
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      if params[:user_ids].present?
        user_ids = params[:user_ids]
        user_ids.each do |user_id|
          @group.users << User.find(user_id)
        end
      end
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render "edit"
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to '/mypage', notice: "グループが削除されました"
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: []).merge(owner_id: current_user.id)
  end

  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end
end
