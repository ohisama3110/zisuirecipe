class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:search].present?
      @groups = Group.where("name LIKE ?", "%#{params[:search]}%")
    else
      @groups = Group.all
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to admin_groups_path, notice: 'グループを削除しました。'
  end
end
