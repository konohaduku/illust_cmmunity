class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: 'ゲストでログインしました。'
  end
     def user_state
    # 入力されたemailからアカウントを1件取得
    @user = user.find_by(email: params[:user][:email])
    # アカウントを取得できなかった場合、このメソッドを終了する
    return unless @user
    # 取得したアカウントのパスワードと入力されたパスワードが一致しているかを判別
    if @user.valid_password?(params[:user][:password])
      # パスワードが一致した場合の処理内容を記述する
      if @user.is_active
        # アカウントが有効な場合の処理内容を記述する
        return
      else
        # アカウントが無効（退会済み）の場合の処理内容を記述する
        flash[:error] = "退会済みのアカウントです。"
        redirect_to  new_user_registration_path
      end
    else
      # パスワードが一致しなかった場合の処理内容を記述する
      flash[:error] = "退会済みのアカウントです。"
      redirect_to  new_user_registration_path
    end
     end
end