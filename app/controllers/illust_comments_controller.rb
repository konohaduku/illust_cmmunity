class IllustCommentsController < ApplicationController

  def create
    @illust = Illust.find(params[:illust_id])
    @illust_comment = current_user.illust_comments.new(illust_comment_params)
    @illust_comment.illust_id = @illust.id
    if @illust_comment.save
      flash.now[:notice] = 'コメントを投稿しました'
    end
  end

  def destroy
    @illust_comment = IllustComment.find(params[:id])
    @illust_comment.destroy
    @illust = Illust.find(params[:illust_id])
  end

  private

  def illust_comment_params
    params.require(:illust_comment).permit(:illust_comment)
  end
end
