class FavoritesController < ApplicationController
   before_action :authenticate_user!

  def create
    @illust = Illust.find(params[:illust_id])
    favorite = current_user.favorites.new(illust_id: @illust.id)
    favorite.save
  end

  def destroy
   @illust = Illust.find(params[:illust_id])
    favorite = current_user.favorites.find_by(illust_id: @illust.id)
    favorite.destroy
  end
end
