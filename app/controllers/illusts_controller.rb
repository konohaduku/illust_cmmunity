class IllustsController < ApplicationController
  def new
    @illust=Illust.new

  end

  def index
    @illusts=Illust.all
    if params[:tag_name]
    @illusts = Illust.tagged_with("#{params[:tag_name]}")
    end
  end

  def edit
    @illust = Illust.find(params[:id])
  end

  def show
    @illust = Illust.find(params[:id])
    @post_favorutes = @illust.favorites
    if params[:tag_name]
    @illusts = Illust.tagged_with("#{params[:tag_name]}")
    end
  end

  def create
    @illust = Illust.new(illust_params)
    @illust.user_id = current_user.id
    if @illust.save
      flash[:notice] = "You have created illust successfully."
      redirect_to illusts_path(@illust)
    else
      @illust = Illust.new
      render :new
    end
  end

  def update
     @illust = Illust.find(params[:id])
    if @illust.update(illust_params)
      redirect_to illust_path(@illust), notice: "編集が完了しました"
    else
      render "edit"
    end
  end

  def destroy
    @illust = Illust.find(params[:id])
    @illust.destroy
    redirect_to illusts_path
  end





  private
  def illust_params
    params.require(:illust).permit(:illust_name, :illust_body, :is_active, :tag_list, illust_images: []).merge(user_id: current_user.id)
  end




end



