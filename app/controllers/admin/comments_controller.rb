class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:search].present?
      @comments = Comment.where("content LIKE ?", "%#{params[:search]}%")
    else
      @comments = Comment.all
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path, notice: "コメントが削除されました"
  end
end
