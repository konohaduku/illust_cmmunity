class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]
  before_action :admin_user,     only: [:destroy]

  def index
    @users=User.all
    # @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def show
    @user=User.find(params[:id])
    @illusts = @user.illust.page(params[:page])
  end

  def create
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

  def if_not_admin
    　　redirect_to root_path unless current_user.admin?
  end
end
