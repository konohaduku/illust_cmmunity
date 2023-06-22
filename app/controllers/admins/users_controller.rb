class Admin::UsersController < ApplicationController
   before_action :authenticate_admin!

  def show
    @user = user.find(params[:id])
  end

  def index
    @users = user.find(params[:id])
  end
end
