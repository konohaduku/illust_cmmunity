class IllustCommentsController < ApplicationController

  def create
    @illust = Illust.find(params[:illust_id])
    @illust_comment = current_user.illust_comments.new(illust_comment_params)
    @illust_comment.illust_id = @illust.id
    if @illust_comment.save
      redirect_to illust_path(@illust), notice: 'コメントを投稿しました'
    else
      render 'illusts/show'
    end
  end

  def destroy
    IllustComment.find_by(id: params[:id], illust_id: params[:illust_id]).destroy
    redirect_to illust_path(params[:illust_id]), alert: 'コメントを削除しました'
    @illust = Illust.find(params[:illust_id])
  end

  private

  def illust_comment_params
    params.require(:illust_comment).permit(:illust_comment)
  end
end
