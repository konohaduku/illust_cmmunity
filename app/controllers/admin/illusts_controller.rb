class Admin::IllustsController < ApplicationController
     before_action :authenticate_user!
　　before_action :if_not_admin
　　before_action :illust, only: [:index, :new, :show, :destroy]

  def destroy
    @illust = Illust.find(params[:id])
    @illust.destroy
    redirect_to admin_illust_path
  end

　　private
  　　def if_not_admin
    　　redirect_to root_path unless current_user.admin?
  　　end

  　　def illust_params
    　　@illust = Illust.find(params[:id])
  　　end
end
