class Admin::IllustsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  
  def index
    @illusts=Illust.all
    if params[:tag_name]
    @illusts = Illust.tagged_with("#{params[:tag_name]}")
    end
  end
  
  def show
    @illust = Illust.find(params[:id])
    @user = @illust.user
    @favorites = @illust.favorites
    @illust_comment = IllustComment.new
    if params[:tag_name]
    @illusts = Illust.tagged_with("#{params[:tag_name]}")
    end
  end
end
