class Admin::IllustsController < ApplicationController
     before_action :authenticate_user!
  before_action :if_not_admin
  before_action :illust, only: [:index, :new, :show, :destroy]

 def index
    @illusts=Illust.page(params[:page])
    if params[:tag_name]
    @illusts = Illust.tagged_with("#{params[:tag_name]}").page(params[:page])
    end
 end

  def edit
    @illust = Illust.find(params[:id])

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

  def destroy
    @illust = Illust.find(params[:id])
    @illust.destroy
    redirect_to admin_illusts_path
  end

 private

 def if_not_admin
   redirect_to root_path
   unless current_user.admin?
   end
 end

  def illust_params
   @illust = Illust.find(params[:id])
  end
end
